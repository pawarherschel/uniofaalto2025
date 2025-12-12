#import "utils.typ": *

#import "@preview/touying:0.5.5": *
#import themes.metropolis: *

#import "@preview/tiaoma:0.3.0": barcode
#import "@preview/catppuccin:1.0.1": catppuccin, flavors
#import "@preview/one-liner:0.2.0": fit-to-width
#import "@preview/biceps:0.0.1": flexwrap
#import "@preview/fontawesome:0.6.0": *

#let todo(content) = highlight(content)

#let flavor = flavors.mocha
#let palette = flavor.colors
#let themes = palette.pairs().filter(((_, it)) => it.accent).to-dict()
#let non-accent = palette.pairs().filter(((_, it)) => not it.accent).to-dict()
#let (mauve, pink, rosewater, lavender, ..) = themes
#import "@preview/numbly:0.1.0": numbly

#set document(
  title: "Introduction Video",
  author: "Herschel Pravin Pawar",
  date: datetime.today(),
)

#let text-color = non-accent.text.rgb
#let alert-primary-color = pink.rgb
#let alert-secondary-color = rosewater.rgb
#let header-background-color = lavender.rgb
#let slide-background-color = non-accent.base.rgb
#let focus-background-color = non-accent.crust.rgb
#let focus-text-color = non-accent.surface0.rgb

#let primary = alert-primary-color
#let primary-light = alert-secondary-color
#let secondary = header-background-color
#let neutral-lightest = slide-background-color
#let neutral-dark = focus-background-color
#let neutral-darkest = text-color


#let creative-font = "SpaceMono Nerd Font Propo"

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  navigation: none,
  config-info(
    title: context repr(document.title),
    subtitle: [
      University of Aalto\
      #text(size: 0.8em)[
        #alert[Context:]
        - Text #link("https://sakurakat.systems")[decorated like this] are links
        - Acknowledgements at the end of the presentation
        - Text using #text(font: creative-font, creative-font) are supposed to be "#text(font: creative-font)[creative]" elements
        - List of tables, images, and links are in the Appendix at the end
          - Download the presentation from #github-card("pawarherschel/uniofaalto2025") to view them
      ]
    ],
    author: "Author: " + context document.author,
    date: "Date: " + context document.date,
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

#set table(stroke: text-color)
#set text(font: "JetBrains Mono")

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

#let blank-slide = focus-slide(config: (freeze-slide-counter: false))[
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

#title-slide()

// = \= Outline <touying:hidden>

// #align(top)[
//   #outline(title: none)
// ]

// = Self Introduction

// == Who am I?

// #grid(
//   columns: 2,
//   rows: 1,
//   align: center,
//   column-gutter: 2%,
//   block(height: 1fr)[
//     // #figure(
//     //   image(
//     //     "me.png",
//     //     alt: "image of Herschel Pravin Pawar",
//     //     fit: "contain",
//     //     height: 1fr,
//     //   ),
//     //   caption: [Image of me #filepath("me.png")],
//     // )
//   ],
//   align(left + horizon)[
//     #text(size: 27pt)[
//       #grid(
//         rows: 1,
//         columns: 2,
//         column-gutter: 2%,
//         // image("kibty.svg", height: 3em),
//         align(left + horizon)[
//           #alert[Herschel Pravin Pawar]
//           #linebreak()
//           #text(
//             font: creative-font,
//             size: 0.8em,
//           )[#link("https://sakurakat.systems")[sakurakat.systems] <links>]
//         ],
//       )
//     ]
//     #align(bottom)[
//       #text(size: 1em)[
//         #par(justify: true)[
//           #text(size: 0.695em)[
//             Everything you see in this video --- scripts, links, and images --- are a part of a Typst document available freely on GitHub under mit licence.
//           ]
//         ]
//         #grid(
//           rows: 1,
//           columns: 2,
//           align: left + horizon,
//           column-gutter: 2%,
//           // image("cc.logo.svg", height: 1em),
//           // [#link("https://github.com/pawarherschel/UniOfAalto")[GitHub:pawarherschel/UniOfAalto] <links>],
//         )
//       ]
//     ]
//   ],
// )


= Self Introduction



== Who am I?


= Bevy: Rust


= Parrylord: Solo Developer


= Parrylord: Theme


= Parrylord: Result


= Godot


= Your Own Size: Artist (+ Tech Artist + Coordinator)


= Your Own Size: Theme


= Your Own Size: Showcase


= Your Own Size: The problem


= Your Own Size: Solution


= Your Own Size: Result


= Coventry University Summer School


= Fractured Elements: Lead Developer


= Fractured Elements: Theme


= Fractured Elements: Result


= Coventry University Summer School: Result


= Cosmos Conquerors: Solo Developer


= Cosmos Conquerors: Theme


= Cosmos Conquerors: Result


= Krita Palette Creator / Rosetta Code


= Why Aalto?


= Acknowledgement


