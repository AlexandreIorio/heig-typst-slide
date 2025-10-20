#import "style.typ": apply_presentation_style
#import "@preview/polylux:0.4.0": *

#let speaker-note = toolbox.pdfpc.speaker-note

#let header_and_footer_font_size = 12pt
#let apply_presentation(
  content,
  title: "MyPresentation",
  subtitle: "MySubtitle",
  date: none,
  authors: ("Alexandre Iorio",),
  logo_path: "img/heig-vd.png",
  titleColor: none,
) = {

  show: apply_presentation_style

  set page(
    paper: "presentation-16-9",
    margin: (top: 3cm),
    header: context [
      #set text(header_and_footer_font_size)
      #let headings = query(selector(heading.where(level: 2)))
      #let slide_title = headings.rev().find(x => x.location().page() <= here().page())
      #grid(
        columns: (1fr,  1fr),
        align: (left, right),
        image("img/heig-vd.png", width: 20%, fit: "contain"), 
        align(right, subtitle),
      )
      #block(height: 0.2cm)
    ],
    footer: context [
      #set text(header_and_footer_font_size)
      #let authors = if(type(authors) == array) { authors } else { (authors,) }

      #let footer_left_part =  authors.join(", ")
     
      #grid(
        columns: (3fr, 1fr, 3fr),
        grid.cell(
          x: 0,
          align(left + top, footer_left_part),
        ),

        grid.cell(
          x: 1,
          align(center + top, counter(page).display("1/1", both: true)),
        ),
        grid.cell(
          x: 2,
          align(right + top, title),
        )
      )
    ],
  )
  align(horizon)[
    #content
  ]
}

