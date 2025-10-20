#let font_size = 18pt
#let heading1 = 48pt
#let heading2 = 36pt
#let heading3 = 30pt
#let heading4 = 24pt
#let heading5 = 20pt
#let quote_char = text(size: font_size + 20pt)[\u{201C}]
#let second_quote_char = text(size: font_size + 20pt)[\u{201D}]

#let apply_presentation_style(content) = {
  set heading(numbering: none)
  set text(size: font_size, font: "Segoe UI", weight: "light")
  show heading.where(level: 1): it => [
    #set text(size: heading1, weight: "light")
    #it
    #v(0.4em)
  ]
  show heading.where(level: 2): it => [
    #set text(size: heading2, weight: "light")
    #it
    #v(0.2em)
  ]
  show heading.where(level: 3): it => [
    #set text(size: heading3, weight: "light")
    #it
    #v(0.2em)
  ]
  show heading.where(level: 4): it => [
    #set text(size: heading4, weight: "light")
    #it
    #v(0.2em)
  ]
  show heading.where(level: 5): it => [
    #set text(size: heading5, weight: "bold")
    #it
    #v(0.2em)
  ]

  show figure.caption: it => [
      #set text(size: font_size * 0.5, fill: rgb("#6d6c6c"), style: "italic")
      #it
    ]

  show quote: it => [
    #set quote(block: true)
    #block(breakable: false)[
      #align(left)[
        #set text(fill: rgb("#6d6c6c"), style: "italic")
        #set table(
          stroke: (x, y) => if y == 0 {
            (bottom: 0.7pt + black)
          },
        )
        #table(
          columns: (1.5fr, 16fr, 1fr),
          stroke: (none, (left: 1.8pt + rgb("#6d6c6c")), none),
          align: (left, left, bottom),
          [#quote_char], [#it.body],[],
          [],[#align(right)[-- #text(size : font_size * 0.8 )[#it.attribution] --]],[#place(bottom, dy: 1.5em)[#second_quote_char]],
        )
        
      ]
    ]
  ]

  show raw: it => [
    #let block_width = auto
    #let inset = 0.0em
    #let outset = 0.3em
    #let margin = 0.1em
    #if (it.block) {
      block_width = 100%
      inset = 1em
    }
    #box(
      radius: 0.5em,
      fill: rgb("#e6e6e6"),
      inset: inset,
      outset: outset,
      width: block_width,
    )[
      #set text(font: "CommitMono Nerd Font Mono")
      #if (it.block and it.lang != none) {
        place(right + top, dy: -1.9em, dx: -1em)[
          #box(
            text(it.lang, weight: "bold", size: 8pt),
            inset: 0.4em,
            stroke: rgb("#d1d9e0"),
            radius: 0.3em,
            fill: rgb("#ffffff"),
          )
        ]
        it
      } else if (it.lang != none){
        it
      } else {
        text(it, weight: "bold", fill: rgb("#823af5"))
      }
    ]
  ]

  content
}
