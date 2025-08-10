#import "@preview/slydst:0.1.4": *
#import "style.typ": apply_presentation_style, font_color

#let header_and_footer_font_size = 8pt
#let apply_presentation(
  content,
  title: "MyPresentation",
  subtitle: "MySubtitle",
  date: none,
  authors: ("Alexandre Iorio",),
  logo_path: "img/heig-vd.png",
  ratio: 16 / 9,
  titleColor: none,
) = {

  show: apply_presentation_style

  show: slides.with(
    title: [
      #place(top + left)[
        #image(
          logo_path,
          width: 15%,
          height: -15%,
          fit: "contain",
        )
      ]
      #title
    ],
    subtitle: subtitle,
    date: none,
    authors: authors,
    layout: "medium",
    ratio: 16 / 9,
    title-color: font_color
  )


  set page(
    header: context [
      #set text(header_and_footer_font_size)
      #let headings = query(selector(heading.where(level: 2)))
      #let slide_title = headings.rev().find(x => x.location().page() <= here().page())
      #grid(
        columns: (1fr, 1fr, 1fr),
        align: (left, center, right),
        image("img/heig-vd.png", width: 20%, fit: "contain"), 
        text(slide_title.body),
        align(right, title + "\n" + subtitle),
      )
      #block(height: 0.2cm)
    ],
    footer: context [
      #set text(header_and_footer_font_size)
      #let authors = if(type(authors) == array) { authors } else { (authors,) }
      #let footer_left_part = "Author : " + authors.join(", ", last: " and ")
     

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

