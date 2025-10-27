#import "style.typ": apply_presentation_style
#import "@preview/polylux:0.4.0": *

#let pres_authors = state("Autheur inconnu")
#let pres_title = state("Titre inconnu")

#let debug_zones_color = rgb(255, 0, 0, 0%)
#let color1 = rgb(36, 136, 135)
#let color2 = rgb(0, 77, 76)
#let color3 = rgb(204, 204, 204)
#let angle = 22deg
#let image_oblon = "img/illu_informatique.png"
#let header_and_footer_font_size = 12pt
#let logo_path = "img/heig-vd.png"

#let logo(width: auto, height: auto, fit: "contain") = {
  image(logo_path, width: width, height: height, fit: fit)
}

#let base_page(content) = {
  set page(
    paper: "presentation-16-9",
  )
  content
}

#let title_page(content) = {
  logo(width: 5cm)
  align(horizon)[
    #block(height: 9.5cm, width: 100%, fill: debug_zones_color)[
      #content
    ]
  ]
}

#let content_page(content, section: none) = {
  set page(
    header: context [
      #set text(header_and_footer_font_size)
      #place(bottom)[
        #grid(
          fill: debug_zones_color,
          columns: (1fr, 1fr),
          grid.cell()[
            #logo(height: 1cm)
          ],
          grid.cell()[
            #place(horizon + right)[
              #pres_title.get()
            ]
          ],
        )
      ]

    ],

    footer: context [
      #set text(header_and_footer_font_size)

      #let footer_left_part = pres_authors.get()
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
            align(right + top, section),
          ),
        )
      ]
    ],
  )
  align(horizon)[
    #content
  ]
}

#let apply_presentation(
  content,
  title: "MyPresentation",
  authors: "auteur inconnu",
) = {
  show: apply_presentation_style
  show: base_page
  pres_authors.update(authors)
  pres_title.update(title)
  content
}

