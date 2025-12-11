#let html-slides(body) = {
  show math.equation.where(block: true): html.frame
  show math.equation.where(block: false): eq => box(html.frame(eq))

  html.html({
    html.head({
      html.meta(charset: "utf-8")
      html.meta(
        name: "viewport",
        content: "width=device-width, initial-scale=1.0",
      )
      html.style(read("style.css").replace(regex("[\n|\t]"), ""))
      html.script(read("control.js"))
      html.script(src: "https://cdn.plot.ly/plotly-3.1.0.min.js")
    })
    html.body({
      html.main({
        body
      })
    })
  })
}

#let slide-counter = counter("slide-counter")

#let slide(footer: none, body) = {
  slide-counter.step()
  context html.div(
    id: str(slide-counter.get().first()),
    class: "slide",
    {
      body
      html.div(class: "footer", footer)
      html.div(class: "slidenumber", slide-counter.display())
    },
  )
}

#let banner(body) = html.span(class: "banner", body)

#let plotly-counter = counter("plotly-counter")

#let plotly(
  layout: (
    paper_bgcolor: "#fff0",
    plot_bgcolor: "#fff0",
    xaxis: (gridcolor: "#aaa"),
    yaxis: (gridcolor: "#aaa"),
  ),
  config: (displaylogo: false, responsive: true),
  ..traces,
) = context {
  let plotly-id = "plotly-" + str(plotly-counter.get().first())
  plotly-counter.step()
  html.div(id: plotly-id)
  html.script(
    "Plotly.newPlot(\""
      + plotly-id
      + "\", "
      + json.encode(traces.pos())
      + ", "
      + json.encode(layout)
      + ", "
      + json.encode(config)
      + ");",
  )
}
