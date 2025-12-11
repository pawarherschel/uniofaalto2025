#import "lib.typ": *

#import "@preview/tiaoma:0.3.0": barcode
#import "@preview/catppuccin:1.0.1": catppuccin, flavors
#import "@preview/one-liner:0.2.0": fit-to-width
#import "@preview/biceps:0.0.1": flexwrap
#import "@preview/fontawesome:0.6.0": *

#let todo(content) = highlight(content)

#set document(
title: "Introduction Video",
author: "Herschel Pravin Pawar", date: datetime.today())

#show box.where(width: 1fr): it => context if target == "paged" {it} else { html.elem("span", attrs: (style: (display: "block", width: "100%").pairs().map(it => it.at(0) + ":" + it.at(1)).join(";")), it.body)}

#let inline-css(dict) = dict.pairs().map(it => it.at(0) + ":" + it.at(1)).join(";")

#show: html-slides
#let slide = slide.with(footer: context if target == "paged" {
  table(
  columns: (1fr, 1fr, 1fr),
  box(width: 1fr, repr(document.title)),
  box(width: 1fr, repr(document.author)),
  box(width: 1fr, repr(document.date))
  )
} else {
  [#document.title]
  [#document.author]
  [#document.date]
})

#slide[
  = #context document.title
  == University of Aalto

  Context:
  - Text #link("https://sakurakat.systems")[styled like this] are links.
  - Acknowledgements at the end of the presentation
  - List of tables, images, and links are in #todo[Appendix] at the end
    - Slides are available for download at #todo[Slides link]

  #context if target == "paged" {align(bottom,[
     #raw(``` document.author: ```.text + repr(document.author)  , lang: "typm")\
    #raw(``` document.date: ```.text + repr(document.date)  , lang: "typm")
  ])} else {
    html.elem("section", attrs: (style: inline-css((margin-top: "auto", margin-bottom: "2em"))), [
     #raw(``` document.author: ```.text + repr(document.author)  , lang: "typm")\
    #raw(``` document.date: ```.text + repr(document.date)  , lang: "typm")
  ])
  }
]
#slide[
  = Self Introduction
]
#slide[
  = Who am I?
]
#slide[
  = Bevy: Rust
]
#slide[
  = Parrylord: Solo Developer
]
#slide[
  = Parrylord: Theme
]
#slide[
  = Parrylord: Result
]
#slide[
  = Godot
]
#slide[
  = Your Own Size: Artist (+ Tech Artist + Coordinator)
]
#slide[
  = Your Own Size: Theme
]
#slide[
  = Your Own Size: Showcase
]
#slide[
  = Your Own Size: The problem
]
#slide[
  = Your Own Size: Solution
]
#slide[
  = Your Own Size: Result
]
#slide[
  = Coventry University Summer School
]
#slide[
  = Fractured Elements: Lead Developer
]
#slide[
  = Fractured Elements: Theme
]
#slide[
  = Fractured Elements: Result
]
#slide[
  = Coventry University Summer School: Result
]
#slide[
  = Cosmos Conquerors: Solo Developer
]
#slide[
  = Cosmos Conquerors: Theme
]
#slide[
  = Cosmos Conquerors: Result
]
#slide[
  = Krita Palette Creator / Rosetta Code
]
#slide[
  = Why Aalto?
]
#slide[
  = Acknowledgement
]

/*
#show math.equation: set text(font: "Lete Sans Math")

#slide(footer: none)[
  #title[A Revolutionary Idea in High-Precision Quantum Nano Medicine]

  // #banner(image("img/dna.png"))

  B. Ullshit
  ---
  Oslo, October 2025
  \
  #html.span(style: "font-size: smaller")[(view on desktop, use left/right
    arrows to navigate)]
]

#slide[
  = Theory

  The well known fact
  // @smith87
  $
    integral.surf_Omega(pi)
    (partial (sum_(i = 1)^n bold(x)_i times.o bold(y)_i)^2) / (partial bold(z))
    dif bold(omega)
    =
    bold(A)(tau)^(upright(sans(T))) bold(xi)
  $
  for all $tau > sigma_42$, strongly suggests that our approach leads to
  relevant improvement.
  #lorem(20)
]

#slide[
  = Simulation study

  We performed a prior predictive check using a quadrupled Gaussian Monte-Cristo
  method with inverse-binary semi-symmetry:
  ```py
  from study import result
  print(np.zeros(4, 2).transpose().sum())
  ```
]

#slide[
  = Methods

  #html.video(
    src: "https://cdn.pixabay.com/video/2024/06/11/216233_large.mp4",
    controls: true,
    autoplay: false,
    loop: true,
    style: "width: 50vw",
  )
]

#slide[
  = Results

  #plotly((
    x: (1, 2, 3, 4),
    y: (10, 15, 13, 17),
    mode: "lines+markers",
    type: "scatter",
  ))

  Note the _clear_ upwards trend! #emoji.face.shock
  (Zoom into the second data point!)
]

#slide[
  // #bibliography(style: "apa", "bib.yaml")
]

*/
