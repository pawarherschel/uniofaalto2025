#import "utils.typ": *

#import "@preview/touying:0.6.1": *
#import themes.dewdrop: *

#import "@preview/catppuccin:1.0.1": catppuccin, flavors
#let theme = flavors.mocha
#show: catppuccin.with(theme)

#import "@preview/tiaoma:0.3.0": barcode
#import "@preview/one-liner:0.2.0": fit-to-width
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
  footer: self => {
    let col = neutral-darkest
    set text(fill: col)


    grid(
      columns: (1fr,) * 4,
      align: center,
      document-title,
      {
        show heading: it => it.body
        utils.display-current-heading(level: 1)
      },
      document-author,
      document-date.display(),
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
)

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

#import "@preview/easy-typography:0.1.0": *
#show: easy-typography.with(
  body-size: 15pt,
  fonts: (
    heading: "Jetbrains Mono",
    body: "Jetbrains Mono",
  ),
)

= #document-title
== Context
- This presentation was made for University of Aalto
- Text #link("https://sakurakat.systems")[styled like this] are links.
- Acknowledgements at the end of the presentation
- List of tables, images, and links are in #todo[Appendix] at the end
  - Slides are available for download at #todo[Slides link]
#align(bottom, [
  #raw(
    ``` document.author: ```.text + repr(document-author),
    lang: "typm",
  )\
  #raw(``` document.date: ```.text + repr(document-date), lang: "typm")
])

= Self Introduction
== Who am I?
#grid(
  columns: 2,
  rows: 1,
  align: center,
  column-gutter: 2%,
  block(height: 1fr)[
    // #figure(
    //   image(
    //     "me.png",
    //     alt: "image of Herschel Pravin Pawar",
    //     fit: "contain",
    //     height: 1fr,
    //   ),
    //   caption: [Image of me #filepath("me.png")],
    // )
  ],
  align(left + horizon)[
    #text(size: 27pt)[
      #grid(
        rows: 1,
        columns: 2,
        column-gutter: 2%,
        // image("kibty.svg", height: 3em),
        align(left + horizon)[
          #alert[Herschel Pravin Pawar]
          #linebreak()
          #text(
            font: creative-font,
            size: 0.8em,
          )[#link("https://sakurakat.systems")[sakurakat.systems] <links>]
        ],
      )
    ]
    #align(bottom)[
      #text(size: 1em)[
        #par(justify: true)[
          #text(size: 0.695em)[
            Everything you see in this video --- scripts, links, and images --- are a part of a Typst document available freely on GitHub under mit licence.
          ]
        ]
        #grid(
          rows: 1,
          columns: 2,
          align: left + horizon,
          column-gutter: 2%,
          // image("cc.logo.svg", height: 1em),
          // [#link("https://github.com/pawarherschel/UniOfAalto")[GitHub:pawarherschel/UniOfAalto] <links>],
        )
      ]
    ]
  ],
)

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

