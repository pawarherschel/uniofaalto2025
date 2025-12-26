#import "utils.typ": *

#import "@preview/touying:0.6.1": *
#import themes.dewdrop: *

#import "@preview/catppuccin:1.0.1": catppuccin, flavors
#let theme = flavors.mocha
#show: catppuccin.with(theme)

#import "@preview/tiaoma:0.3.0": barcode
#import "@preview/one-liner:0.2.0": fit-to-width
#import "@preview/oasis-align:0.3.2": *
#import "@preview/biceps:0.0.1": flexwrap
#import "@preview/fontawesome:0.6.0": *

#let todo(content) = highlight(content)

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

#show: dewdrop-theme.with(
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
    // show-notes-on-second-screen: right,
  ),
  config-page(numbering: n => if n < 10 { "0" + str(n) } else { str(n) }),
)

// #pdfpc.config(
// duration-minutes: 2,
// start-time: datetime.today(),
// end-time: datetime(hour: 14, minute: 40, second: 0),
// last-minutes: 5,
// note-font-size: 12,
// disable-markdown: false,
// default-transition: (
//   type: "push",
//   duration-seconds: 2,
//   angle: ltr,
//   alignment: "vertical",
//   direction: "inward",
// ),
// )

#show heading.where(depth: 1): set heading(numbering: (..n) => "=" * 1)
#show heading.where(depth: 2): set heading(numbering: (..n) => "=" * 2)
#show heading.where(depth: 3): set heading(numbering: (..n) => "=" * 3)
#show heading.where(depth: 4): set heading(numbering: (..n) => "=" * 4)

#show list: set list(marker: [-])

#show link: underline
#show link: set underline(stroke: (
  paint: alert-secondary-color,
  dash: "densely-dashed",
))

#set quote(block: true)
#show quote: set align(center)
#show quote: set text(font: creative-font)
#show quote: it => {
  grid(
    rows: 3,
    columns: 3,
    text(size: 3em, baseline: 0.5em)[“], [], [],
    [], text(style: "italic")[#it.body], [],
    [], [], text(size: 3em)[”],
  )
  align(right)[-- #it.attribution]
}


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

#let alert(body) = text(fill: alert-primary-color, body)

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

#let f(path, root: "assets", ..args, c: none) = {
  let inner = image(
    root + "/" + path,
    ..if c != none { (alt: c) },
    ..args,
  )
  if c != none {
    figure(inner, caption: [#c #filepath(root + "/" + path)])
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
              - This presentation was made for University of Aalto
              - Text #link("https://sakurakat.systems")[styled like this] are links.
              - Acknowledgements at the end of the presentation
              - List of tables, images, and links are in #todo[Appendix] at the end
                - Slides are available for download at #todo[Slides link]
            ],
          )
        },
      ),
    ),
  )
}

= #document-title

= Self Introduction
== Who am I?

#speaker-note[meow]
#{
  let left = block(height: 1fr, f(
    "me.jpg",
    c: "Herschel Pravin Pawar in a park with flowers on their ears",
    fit: "cover",
    height: 1fr,
  ))

  let right = {
    let name = alert[Herschel Pravin Pawar]

    let alt-name = context {
      set text(size: 0.75em, font: creative-font)
      let nickname = [kat]
      let height = measure(nickname).height

      nickname
      [ ]
      box(f("Nonbinary_flag.svg", height: height))
    }
    let shill = text(
      size: 0.5em,
      link("https://sakurakat.systems")[sakurakat.systems],
    )

    let full-shill = {
      name
      linebreak()
      alt-name
      linebreak()
      shill
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
        Everything you see in this video --- scripts, links, and images --- are a part of a Typst document available freely on GitHub under a public domain licence.
      ])
      // fit-to-width(
      context {
        let t = github-card(
          "pawarherschel/uniofaalto2025",
          paged-content: [GitHub:pawarherschel#linebreak()/uniofaalto2025],
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
          [Attributions available at #linebreak()assets/attributions.toml],
          height: height,
        )
      }
      // )
    }))
  }

  grid(
    columns: (1fr, 2fr),
    align: alignment.left + horizon,
    column-gutter: 2%,
    left, right,
  )
}

= Parrylord (Bevy)
== Solo Developer
== Theme
== Result

= Your Own Size (Godot)
== Artist
=== and Tech Artist and Coordinator

== Theme
== Showcase
== The problem
== Solution
== Result

= Coventry University Summer School
== Result

= Fractured Elements (Unity)
== Lead Developer
== Theme
== Result


= Cosmos Conquerors (Godot)
== Solo Developer
== Theme
== Result

= Krita Palette Creator (Rust)
== Rosetta Code

= Why Aalto?

= Acknowledgement

