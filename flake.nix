{
  description = "A Typst project that uses Typst packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    typix = {
      url = "github:loqusion/typix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    # Example of downloading icons from a non-flake source
    # font-awesome = {
    #   url = "github:FortAwesome/Font-Awesome";
    #   flake = false;
    # };
  };

  outputs =
    inputs@{
      nixpkgs,
      typix,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        inherit (pkgs) lib;

        typixLib = typix.lib.${system};

        src = typixLib.cleanTypstSource ./.;
        commonArgs = {
          typstSource = "slides.typ";

          typstOpts.format = "html";
          typstOpts.features = [ "html" ];

          fontPaths = [
            # Add paths to fonts here
            # "${pkgs.roboto}/share/fonts/truetype"
          ];

          virtualPaths = [
            {
              src = ./style.css;
              dest = "style.css";
            }
            {
              src = ./control.js;
              dest = "control.js";
            }
            # Add paths that must be locally accessible to typst here
            # {
            #   dest = "icons";
            #   src = "${inputs.font-awesome}/svgs/regular";
            # }
          ];
        };

        unstable_typstPackages = [
          # {
          #   name = "cetz";
          #   version = "0.3.4";
          #   hash = "sha256-5w3UYRUSdi4hCvAjrp9HslzrUw7BhgDdeCiDRHGvqd4=";
          # }
          # # Required by cetz
          # {
          #   name = "oxifmt";
          #   version = "0.2.1";
          #   hash = "sha256-8PNPa9TGFybMZ1uuJwb5ET0WGIInmIgg8h24BmdfxlU=";
          # }

          {
            name = "wordometer";
            version = "0.1.5";
            hash = "sha256-os3ANhDSfRxZ8XwQWQsj6NNwqjvb+cSBdphL4Lbd7uw=";
          }

          {
            name = "tiaoma";
            version = "0.3.0";
            hash = "sha256-WkbmsZaVbLUgoToI966vR+92DF0KMBMUMKilegpJvWA=";
          }

          {
            name = "catppuccin";
            version = "1.0.1";
            hash = "sha256-2dOtX7fBKaEVzLYcApwDgnFZMBT+wznVo5tR+zcFsf4=";
          }
          {
            name = "valkyrie";
            version = "0.2.2";
            hash = "sha256-j/NO6m83lgbe/0RHcXgFZ+LQHaa3taHWgpdKn3ZPA+o=";
          }
          {
            name = "tidy";
            version = "0.4.3";
            hash = "sha256-Ukx3XnCBRZUu6kQ20EQuQA7VcHhgYzJYGU7CYlqtVnQ=";
          }
          
          {
            name = "one-liner";
            version = "0.2.0";
            hash = "sha256-hbb7Hjt8JTHnX39sX4tZd13nzipLFM9ykA0cyC/TTYU=";
          }

          {
            name = "biceps";
            version = "0.0.1";
            hash = "sha256-HZvlkJFed4rdWPzhXv6v7binjnctVvqf4j79ZHkQcBs=";
          }

          {
            name = "fontawesome";
            version = "0.6.0";
            hash = "sha256-dgb+YAYLEKgMMEWa8yelMvRdEoesPj5HI+70w3mCUcQ=";
          }

        ];

        # Compile a Typst project, *without* copying the result
        # to the current directory
        build-drv = typixLib.buildTypstProject (
          commonArgs
          // {
            inherit src unstable_typstPackages;
          }
        );

        # Compile a Typst project, and then copy the result
        # to the current directory
        build-script = typixLib.buildTypstProjectLocal (
          commonArgs
          // {
            inherit src unstable_typstPackages;
          }
        );

        # Watch a project and recompile on changes
        watch-script = typixLib.watchTypstProject commonArgs;
      in
      {
        checks = {
          inherit build-drv build-script watch-script;
        };

        packages.default = build-drv;

        apps = rec {
          default = watch;
          build = flake-utils.lib.mkApp {
            drv = build-script;
          };
          watch = flake-utils.lib.mkApp {
            drv = watch-script;
          };
        };

        devShells.default = typixLib.devShell {
          inherit (commonArgs) fontPaths virtualPaths;
          packages = [
            # WARNING: Don't run `typst-build` directly, instead use `nix run .#build`
            # See https://github.com/loqusion/typix/issues/2
            # build-script
            watch-script
            # More packages can be added here, like typstfmt
            # pkgs.typstfmt
            pkgs.tinymist
            pkgs.typstyle
          ];
        };
      }
    );
}
