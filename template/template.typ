#import "style.typ": apply_presentation_style
#import "@preview/polylux:0.4.0": *



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
    margin: (top: 2.5cm, bottom: 1.5cm, left: 0.5cm, right: 0.5cm),
    header: context [
      #set text(header_and_footer_font_size)
      #let headings = query(selector(heading.where(level: 2)))
      #let slide_title = headings.rev().find(x => x.location().page() <= here().page())
      #align(bottom)[

        #grid(
          columns: (1fr, 1fr),
          align: (left, right),
          image("img/heig-vd.png", width: 15%, fit: "contain"), align(right, subtitle),
        )
        #block(height: 0.2cm)
      ]
    ],
    footer: context [
      #set text(header_and_footer_font_size)
      #let authors = if (type(authors) == array) { authors } else { (authors,) }

      #let footer_left_part = authors.join(", ")
      #align(horizon)[

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
          ),
        )
      ]
    ],
  )
  align(horizon)[
    #content
  ]
}

