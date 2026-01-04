// =============================================================================
//  Script & Slide Content License: CC BY-ND 4.0
//  Copyright (c) 2025 Herschel Pravin Pawar
//
//  The text, script, and personal assets in this file are licensed under the
//  Creative Commons Attribution-NoDerivatives 4.0 International License.
//  You may share this work, but you cannot modify it.
// =============================================================================

#import "utils.typ": *

#import "@preview/touying:0.6.1": *
#import themes.metropolis: *

#import "@preview/catppuccin:1.0.1": catppuccin, flavors
#let theme = flavors.latte
#show: catppuccin.with(theme)

#import "@preview/tiaoma:0.3.0": barcode
#import "@preview/one-liner:0.2.0": fit-to-width
#import "@preview/oasis-align:0.3.2": *
#import "@preview/biceps:0.0.1": flexwrap
#import "@preview/fontawesome:0.6.0": *

#import "@preview/stonewall:0.2.0": flags

#import "@preview/tessera:0.1.0": masonry, transform
#import transform: ccw

#import "@preview/lovelace:0.3.0": *
#import "@preview/fancy-tiling:1.0.0": *

#let todo(content) = highlight(fill: theme.colors.red.rgb, text(
  fill: theme.colors.base.rgb,
  [TODO: #content],
))

#let (document-title, document-author, document-date) = (
  document-title: "Introduction Video",
  document-author: "Herschel Pravin Pawar",
  document-date: datetime.today(),
)

#set document(
  title: document-title,
  author: document-author,
  date: document-date,
)

#let creative-font = "SpaceMono Nerd Font Propo"
#let emoji-font = "Noto Color Emoji"

#let text-color = theme.colors.text.rgb
#let alert-primary-color = theme.colors.pink.rgb
#let alert-secondary-color = theme.colors.rosewater.rgb
#let header-background-color = theme.colors.lavender.rgb
#let slide-background-color = theme.colors.base.rgb
#let focus-background-color = theme.colors.crust.rgb
#let focus-text-color = theme.colors.surface0.rgb

#let primary = alert-primary-color
#let primary-light = alert-secondary-color
#let secondary = header-background-color
#let neutral-lightest = slide-background-color
#let neutral-dark = focus-background-color
#let neutral-darkest = text-color

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer-right: context {
    utils.slide-counter.display(it => if it < 10 {
      hide[0]
      str(it)
    } else {
      str(it)
    })
    " / "
    utils.last-slide-number
  },
  footer: self => {
    let col = neutral-darkest
    set text(fill: col)
    box(
      inset: (right: 3%),
      grid(
        columns: 5,
        column-gutter: 3%,
        align: center,
        document-title,
        {
          align(left, box(width: 1fr, utils.display-current-heading(level: 1)))
        },
        document-author,
        document-date.display(),
      ),
    )
  },
  navigation: none,
  config-info(
    title: text(fill: black, document-title),
    author: document-author,
    date: datetime.today(),
  ),
  config-colors(
    primary: primary,
    primary-light: primary-light,
    secondary: secondary,
    neutral-lightest: neutral-lightest,
    neutral-dark: neutral-dark,
    neutral-darkest: neutral-darkest,
  ),
  config-common(
    slide-fn: slide.with(composer: self => {
      show: align.with(center + horizon)
      show: block.with(height: 1fr)
      show: align.with(left)
      self
    }),
    // Taken from the metropolis theme itself
    new-section-slide-fn: (
      config: (:),
      level: 1,
      numbered: true,
      body,
    ) => touying-slide-wrapper(self => {
      let slide-body = {
        // set std.align(horizon)
        show: pad.with(20%)
        set text(size: 1.5em)
        stack(
          dir: ttb,
          spacing: 1em,
          text(self.colors.neutral-darkest, utils.display-current-heading(
            level: level,
            numbered: numbered,
            style: auto,
          )),
          block(
            height: 2pt,
            width: 100%,
            spacing: 0pt,
            components.progress-bar(
              height: 2pt,
              self.colors.primary,
              self.colors.primary-light,
            ),
          ),
        )
        text(self.colors.neutral-dark, body)
      }
      self = utils.merge-dicts(
        self,
        config-page(fill: self.colors.neutral-lightest),
      )
      touying-slide(self: self, config: config, slide-body)
    }),

    // show-notes-on-second-screen: right,
  ),
  config-page(numbering: n => if n < 10 { "0" + str(n) } else { str(n) }),
)

#show heading.where(depth: 1): set heading(numbering: (..n) => "=" * 1)
#show heading.where(depth: 2): set heading(numbering: (..n) => "=" * 2)
#show heading.where(depth: 3): set heading(numbering: (..n) => "=" * 3)
#show heading.where(depth: 4): set heading(numbering: (..n) => "=" * 4)

#show list: set list(marker: [-])

#show link: underline
#show link: set underline(
  stroke: (
    paint: alert-secondary-color,
    // dash: "densely-dashed",
    thickness: 2pt,
  ),
)

#let alert(body) = text(fill: alert-primary-color, body)

#set quote(block: true)
#show quote: set align(center)
#show quote: set text(font: creative-font, fill: alert-secondary-color)
#show quote: it => {
  box({
    box(
      inset: (y: 0.5em, x: 0.25em),
      fa-quote-left(solid: true),
    )
    text(it.body, style: "italic")
    box(
      inset: (y: -0.5em, x: 0.25em),
      fa-quote-right(solid: true),
    )
  })

  if it.attribution != none {
    align(right)[-- #it.attribution]
  } else {
    v(1em)
  }
}

#set table(stroke: alert-primary-color)

#set image(scaling: "pixelated")

#let blank-slide = slide[
  #text(
    font: creative-font,
    style: "italic",
    weight: "light",
    stretch: 70%,
    size: 39.3pt,
    fill: focus-text-color,
  )[
    #smallcaps[This Page Has Been Intentionally Left Blank]
  ]
]


#let filepath(file, full-file: none) = {
  let file = file.codepoints().map(c => [#sym.wj#c]).join()
  let file-at = "preview file".codepoints().map(c => [#sym.wj#c]).join()
  let full-file-at = "original file".codepoints().map(c => [#sym.wj#c]).join()
  let joiner = [~#sym.wj\@#sym.wj~]
  if full-file == none {
    text(size: 0.7em)[#linebreak()#full-file-at#joiner#file]
  } else {
    text(size: 0.7em)[
      #linebreak()
      #file-at#joiner#file
      #linebreak()
      #full-file-at#joiner#full-file
    ]
  }
}

#let f(path, root: "assets", ..args, c: none, fp: none) = {
  if fp == none {
    fp = root + "/" + path
  }

  let inner = if type(path) == type("string") {
    image(
      fp,
      ..if c != none { (alt: c) },
      ..args,
    )
  } else if fp == none {
    panic("fp is not given and path isn't a string")
  } else {
    path
  }
  if c != none {
    figure(inner, caption: [#c #filepath(fp)])
  } else { inner }
}


#import "@preview/easy-typography:0.1.0": *
#show: easy-typography.with(
  body-size: 15pt,
  fonts: (
    heading: "Jetbrains Mono",
    body: "Jetbrains Mono",
  ),
)

#set par(justify: true, linebreaks: "optimized")
#set par(justification-limits: (
  tracking: (min: -0.1em, max: 0.2em),
))

#{
  set text(size: 1.4em)

  title-slide(
    extra: block(
      height: 1fr,
      align(
        top,
        {
          speaker-note[meow]
          box(
            inset: (top: 3em),
            width: 1fr,
            align(left)[
              = Context
              - This presentation was made for Aalto University
              - Text #link("https://sakurakat.systems")[styled like this] are links.
              - Acknowledgements are at the end of the presentation
              - The list of tables, images, and links is in the #link(label("appendix"))[Appendix] at the end
                - Slides are available for download at #link(github-blob-to-raw("https://github.com/pawarherschel/uniofaalto2025/blob/main/script.pdf"))
            ],
          )
        },
      ),
    ),
  )
}

= Outline
#slide(columns(2, outline()), align: top)

= Self Introduction
== Who am I?
#{
  let left = block(height: 1fr, f(
    "me.jpg",
    c: "Herschel Pravin Pawar in a park with flowers on their ears",
    fit: "cover",
    height: 1fr,
  ))

  let right = {
    let name = alert(document-author)

    let alt-name = context {
      set text(size: 0.75em, font: creative-font)
      let nickname = text(
        font: creative-font,
      )[kat #text(font: emoji-font, emoji.cat.smile) #text(font: emoji-font, "🌸") ]
      let height = measure(nickname).height

      nickname
    }
    let shill = text(
      size: 0.5em,
      link("https://sakurakat.systems")[sakurakat.systems],
    )

    let full-shill = {
      name

      grid(
        columns: ((1 / 3) * 100%, auto),
        column-gutter: 2%,
        block(
          height: 2em,
          width: 100%,
          hide[MEOW],
          fill: gradient
            .linear(
              dir: ttb,
              ..flags.to-dict().at("nonbinary"),
            )
            .sharp(5),
        ),
        {
          alt-name
          linebreak()
          shill
        },
      )
    }

    fit-to-width(context {
      let t = full-shill
      let height = measure(t).height

      grid(
        columns: 2,
        column-gutter: 2%,
        f("kibty.svg", height: height), t,
      )
    })


    align(bottom, text(size: 1em, {
      par(justify: true, linebreaks: "optimized", text(size: 0.9em)[
        Everything you see in this video - scripts, links, and images - is
        part of a Typst document available freely on GitHub. The code is MIT licensed.
        The assets and script text are under CC BY-ND 4.0. You are free to share this
        presentation, but please do not modify the script or the assets.
      ])
      context {
        let t = github-card(
          "pawarherschel/uniofaalto2025",
          paged-content: [
            GitHub:pawarherschel
            #linebreak()
            /uniofaalto2025
          ],
        )
        let height = measure(t).height

        box(
          link(
            "https://creativecommons.org/licenses/by-nd/4.0/",
            f("cc.logo.svg", height: height),
          ),
        )
        h(1fr)
        box(t)
        h(1fr)
        box(
          [Attributions are in #linebreak()#link(github-blob-to-raw("https://github.com/pawarherschel/uniofaalto2025/blob/main/assets/attributions.toml"))[assets/attributions.toml]],
          height: height,
        )
      }
    }))
  }

  grid(
    columns: (1fr, 2fr),
    align: alignment.left + horizon,
    column-gutter: 2%,
    left, right,
  )
}

#let center-item-with-subtext(center-item, subtext, multiplier: 3) = context {
  let q = box(text(size: multiplier * 1em, center-item))

  block(
    height: 1fr,
    {
      q
      align(top + center, block(
        width: measure(q).width,
        align(left, subtext),
      ))
    },
  )
}

#let logo-center-item-with-subtext(
  logo,
  center-item,
  subtext,
  multiplier: 3,
  ..args,
) = center-item-with-subtext(
  multiplier: multiplier,
  {
    show: align.with(center)
    block(logo, height: 1fr)
    alert(text(font: creative-font, center-item))
  },
  subtext,
)


= Parrylord (Bevy)
#alert[Bevy Jam 6]

== Theme
#center-item-with-subtext(quote[Chain Reaction])[
  Turn the tides - convert the bullet hell into bullet heaven by parrying the enemies' projectiles!
]
== Solo Developer
#center-item-with-subtext(
  multiplier: 1,
  {
    grid(
      columns: 2,
      column-gutter: 2%,
      f(
        "parrylord.png",
        height: 70%,
        width: auto,
        fit: "contain",
        c: "Preview image for the game \"Parrylord\" as seen on itch.io",
      ),
      f(
        "parrylord-leaderboard.png",
        height: 70%,
        width: auto,
        fit: "contain",
        c: "In-game leaderboard for the game",
      ),
    )
  },
  align(center, block(align(left)[
    - First time using Bevy (an ECS in Rust)
    - Created an online leaderboard
      - Using a Cloudflare Worker and Cloudflare KV
  ])),
)


== Result
#let heads = (
  "Criteria",
  "Rank",
  "Score*",
  "Raw Score",
)
#let x = (
  "Audio",
  "#41",
  "2.750",
  "2.750",
  "Game Design",
  "#57",
  "2.708",
  "2.708",
  "Overall",
  "#60",
  "2.479",
  "2.479",
  "Execution",
  "#66",
  "2.375",
  "2.375",
  "Visuals",
  "#81",
  "2.083",
  "2.083",
)
#let score-table(cols, heads, x) = {
  table(
    columns: cols,
    fill: (x, y) => if calc.rem(y, 2) == 0 and y != 0 {
      alert-secondary-color.transparentize(80%)
    } else if heads.len() > 0 and y == 0 {
      alert-secondary-color
    },
    table.header(..heads.map(it => text(fill: slide-background-color, it))),
    ..x
  )
}

#center-item-with-subtext(
  score-table(
    4,
    heads,
    x,
  ),
  multiplier: 2,
)[
  Ranked from *24 ratings*. Score is adjusted from raw score by the median number of ratings per game in the jam.
]


= Your Own Size (Godot)
#alert[GameDev.tv Game Jam 2025]

== Theme
#center-item-with-subtext(quote[Tiny Worlds])[
  Uh Oh, you've been shrunk down to the size of a bug! Time to fight your way
  to the top of his treehouse in the hopes of a cure, or maybe just get some sweet
  revenge. Still, easier said than done; that looks like a long way up from down
  here. _Gulp_
]
== Artist
#center-item-with-subtext(
  multiplier: 1,
  f(
    "your-own-size.png",
    height: 70%,
    c: "Preview image for the game \"Your Own Size\" as seen on itch.io",
  ),
)[
  - Minor role as Tech Artist and Coordinator
    - Wrote my first shader :D
]
== Showcase
#block(
  fill: theme.colors.text.rgb,
  outset: 1em,
  masonry(
    (
      ccw(f("your-own-size/cracked-wood-tileset.png")),
    ),
    (
      f("your-own-size/branch_fall.gif"),
      f("your-own-size/heart.gif"),
      f("your-own-size/kibby.gif"),
    ),
    (
      f("your-own-size/nerd_room.png"),
      f("your-own-size/nerd_room_background.png"),
    ),
    (
      f("your-own-size/water_drop.gif"),
      f("your-own-size/venus_flytrap.gif"),
      f("your-own-size/worm_crawl.gif"),
      f("your-own-size/worm_death.gif"),
    ),
    (
      f("your-own-size/mosquito_attack.gif"),
      f("your-own-size/mosquito_death.gif"),
      f("your-own-size/mosquito.gif"),
      f("your-own-size/mosquito_idle.gif"),
    ),
  ),
)

== The problem
#place(
  top + center,
  f("your-own-size/02_sky.png"),
)
#place(
  top + center,
  f("your-own-size/03_sky.png"),
)
#place(
  top + center,
  f("your-own-size/04_sky.png"),
)
#place(
  top + center,
  f("your-own-size/05_sky.png"),
)

== Solution
#grid(
  columns: 2,
  column-gutter: 2%,
  {
    $
      "blur_level"_t & = cases(
                         min("blur_level"_(t-1) + Delta_"time", 3.0) & "if" "Moving",
                         max("blur_level"_(t-1) - Delta_"time", 0.0) & "if" "Idle"
                       ) \
      "COLOR"."rgba" & = "textureLod"( \
                     & "screen_texture", \
                     & "SCREEN_UV", \
                     & "blur_level"_t \
                   )
    $
  },
  f(
    "your-own-size/anim.gif",
    c: "GIF of the game showing the background blurring and unblurring",
  ),
)

== Result
#let heads = (
  "Criteria",
  "Rank",
  "Score*",
  "Raw Score",
)
#let x = (
  "Theme",
  "#5",
  "4.594",
  "4.594",
  "Story",
  "#22",
  "4.000",
  "4.000",
  "Overall",
  "#24",
  "4.094",
  "4.094",
  "Aesthetics",
  "#44",
  "4.219",
  "4.219",
  "Fun",
  "#62",
  "3.813",
  "3.813",
  "Music",
  "#118",
  "3.594",
  "3.594",
  "Sound",
  "#159",
  "3.344",
  "3.344",
  "Mechanics",
  "#187",
  "3.313",
  "3.313",
)
#center-item-with-subtext(
  multiplier: 2,
  score-table(4, heads, x),
)[
  Ranked from 32 ratings. Score is adjusted from raw score by the median number of ratings per game in the jam.
]

= Coventry University Summer School
#alert[Committing to Game Dev]

== Result
#f("covuni.jpg", c: "Photo of us in the lab", height: 1fr)

= Fractured Elements (Unity)
#alert[Coventry University Summer School '24]

== Theme
#center-item-with-subtext(
  multiplier: 2.2,
  columns(2, {
    quote[Continuous Change]
    colbreak()
    quote[2D Platformer]
  }),
)[
  The main character has latent powers that awaken one day when the elemental golems activated. To gain control over their power, the player needs to defeat the golems.
]
== Lead Developer
#grid(
  columns: 2,
  column-gutter: 2%,
  f(
    "fractured-elements.png",
    c: "Logo for the game \"Fractured Elements\" showing the two active elements of the player.",
    height: 1fr,
  ),
  f("shashank-and-me.jpg", c: "Photo of Shashank and me", height: 1fr),
)
== Result
#let x = (
  "Gameplay",
  "#2",
  "3.286",
  "3.600",
  "Presentation",
  "#2",
  "3.469",
  "3.800",
  "Creativity",
  "#3",
  "2.739",
  "3.000",
  "Enjoyment",
  "#3",
  "2.921",
  "3.200",
)
#center-item-with-subtext(
  multiplier: 2,
  score-table(4, heads, x),
)[
  Ranked from *5 ratings*. Score is adjusted from raw score by the median number of ratings per game in the jam.
  #line(length: 100%, stroke: alert-secondary-color)
  *Visually nice* platformer game with a pixel art approach and *switching
  characters* that allow either melee or ranged attacks. Multiple levels make it
  interesting and force the player to master their jumping and attacking skills.
  There is a final boss for the finale. One improvement I would suggest is that I
  was *unsure what caused me to change between the characters* - I was not sure if
  it was timed, depending on where I was in the level or a button press. Well done
  to all involved in the game and the hard work you put into it!
]

= Cosmos Conquerors (Godot)
#alert[GMTK Game Jam 2023]

== Theme
#center-item-with-subtext(quote[Role Reversal])[
  It's time to turn the tables and show those heroes who's boss!
]
== Solo Developer
#center-item-with-subtext(alert(text(
  font: creative-font,
  style: "italic",
  "Cosmos Conquerors",
)))[
  First game jam I participated in
]
== Result
#let x = (
  "Enjoyment",
  "#4296",
  "2.237",
  "2.583",
  "Overall",
  "#4652",
  "2.285",
  "2.639",
  "Presentation",
  "#4720",
  "2.237",
  "2.583",
  "Creativity",
  "#4780",
  "2.382",
  "2.750",
)
#center-item-with-subtext(
  multiplier: 2,
  score-table(4, heads, x),
)[
  Ranked from *12 ratings*. Score is adjusted from raw score by the median number of ratings per game in the jam.
]


= Krita Palette Creator (Rust)
#alert[
  I had a recurring problem

  I solved the problem
]

== Rosetta Code
#block(height: 1fr, {
  columns(2, {
    f("kpc/2.png", c: "The original full-quality image taken in VRChat")
    colbreak()
    f("kpc/2.png.5.png", c: "Quantized output of the image")
  })


  let file-path = "assets/kpc/2.png.5.png.gpl"
  let file = read(file-path)
  file = file.split("\n")
  let _ = file.remove(0)
  let _ = file.remove(0)
  let _ = file.remove(0)
  let _ = file.remove(0)
  let lines = file
    .map(line => {
      let x = line.split("\t")
      x.at(1, default: none)
    })
    .filter(it => it != none)

  let rgbs = lines.map(it => {
    rgb(it)
  })

  f(
    {
      move(
        grid(
          columns: rgbs.len(),
          rows: 2,
          row-gutter: 2%,
          ..rgbs
            .map(it => it.to-hex())
            .map(it => rotate(-45deg, it, reflow: true, origin: left + horizon))
            .map(it => move(it, dx: 75%)),
          ..rgbs.map(it => rect(
            fill: it,
            stroke: 1pt + theme.colors.red.rgb,
          )),
        ),
        dx: -10pt,
      )
    },
    fp: file-path,
    c: "Quantized colors produced by the program ("
      + str(rgbs.len())
      + " (2^"
      + str(calc.log(rgbs.len(), base: 2))
      + ") colors)",
  )
})


= Acknowledgements
#alert[Never alone]

== Heavily Inspired by
#box(width: 1fr, grid(
  row-gutter: 1fr,
)[
  #hide[meow]
][
  === Overall Vibe
  - / #link(
        "https://www.youtube.com/@Acerola_t",
      )[Acerola]: general vibes
  - / #link(
        "https://www.youtube.com/@NoBoilerplate",
      )[No Boilerplate]: fast paced style that requires you to read and listen
][
  === Creative Inspirations
  - / #link(
        "https://www.youtube.com/@chrishayuk",
      )[Chris Hay]: webcam editing style
  - / #link(
        "https://www.youtube.com/@Leadhead",
      )[Leadhead]: game backgrounds while speaking to the camera
][
  === Made with #text(fill: theme.colors.lavender.rgb, font: emoji-font, emoji.heart.purple) using
  - / #link(
        "https://typst.app/",
      )[Typst]: An alternative to LaTeX written in Rust
  - / #link("https://kdenlive.org/")[kdenlive]: Video editor
  - / #link("https://www.audacityteam.org/")[Audacity]: Audio editor
  - / #link("https://touying-typ.github.io/")[Touying]: Slides framework
    - / Metropolis: Slides theme
    - / #link(
          "https://github.com/touying-typ/touying-exporter",
        )[Touying Exporter]: Exporting slides to HTML
  - / #link("https://github.com/catppuccin/typst")[Catppuccin]: The colors :3
][
  === Fonts
  - / Primary font: #link(
        "https://www.jetbrains.com/lp/mono/",
      )[#context text.font]
  - / Alternative font: #link(
        "https://fonts.google.com/specimen/Space+Mono",
      )[#creative-font]
  - / Emoji font: #link(
        "https://fonts.google.com/noto/specimen/Noto+Color+Emoji",
      )[#emoji-font]
][
  #hide[meow]
])

== Important Links



#box(
  width: 1fr,
  (
    ("Repository", "https://github.com/pawarherschel/uniofaalto2025"),
    (
      "Script Source",
      "https://github.com/pawarherschel/uniofaalto2025/blob/main/script.typ",
    ),
    (
      "Compiled Script",
      "https://github.com/pawarherschel/uniofaalto2025/blob/main/script.pdf",
    ),
    (
      "Slides Source",
      "https://github.com/pawarherschel/uniofaalto2025/blob/main/script.typ",
    ),
    (
      "Compiled Slides",
      "https://github.com/pawarherschel/uniofaalto2025/blob/main/script.pdf",
    ),
    (
      "HTML Slides",
      "https://github.com/pawarherschel/uniofaalto2025/blob/main/script.html",
    ),
    ("Portfolio Link", "https://sakurakat.systems/portfolio/"),
    (
      "CV",
      "https://github.com/pawarherschel/resume/blob/main/resume.pdf",
    ),
  )
    .map(it => [
      - / #it.at(0): #link(it.at(1))
      #if it.at(1).contains("blob") [
        - / #it.at(0) Download: #link(github-blob-to-raw(it.at(1)))
      ]])
    .join(),
)

#pagebreak()

#show: appendix.with()

= Appendix <appendix>

= Links
#pagebreak()
#slide[
  #context {
    let links = query(link)

    table(
      columns: (20%, 1fr, 5%),
      table.header(..("dest", "body", "page")),
      ..for link in links
        .filter(it => type(it.dest) == str)
        .filter(it => (
          it.location().page()
            <= counter("touying-last-slide-counter").final().at(0)
        )) {
        let (dest, body) = link.fields()

        (
          body,
          repr(dest),
          std.link(link.location(), repr(link.location().page())),
        )
      },
    )
  }
]

= Images
#pagebreak()
#slide[
  #context {
    let imgs = query(image)
    let attrs = toml("assets/attributions.toml")

    table(
      columns: (1fr, 5%, 20%, 20%),
      table.header(..("path", "page", "By", "License")),
      ..for img in imgs.filter(it => (
        it.location().page()
          <= counter("touying-last-slide-counter").final().at(0)
      )) {
        let (source, page) = img.fields()
        let (by, under) = attrs.at(source)

        let by = if by.at("link", default: none) != none {
          std.link(by.link, by.name)
        } else {
          by.name
        }

        let under = if under.at("link", default: none) != none {
          std.link(under.link, under.name)
        } else {
          under.name
        }

        (
          source,
          link(
            img.location(),
            str(page),
          ),
          by,
          under,
        )
      },
    )
  }
]


= Figures
#pagebreak()
#slide[
  #context {
    let figs = query(figure)

    table(
      columns: 2,
      table.header(..("caption", "page")),
      ..for fig in figs.filter(it => (
        it.location().page()
          <= counter("touying-last-slide-counter").final().at(0)
      )) {
        let (caption,) = fig.fields()


        (
          caption,
          std.link(fig.location(), repr(fig.location().page())),
        )
      },
    )
  }
]
