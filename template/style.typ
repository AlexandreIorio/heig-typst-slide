#import "heig-typst-report/style.typ": apply_style, font_color

#let apply_presentation_style(content) = {
  show : apply_style
  set heading(numbering: none)
  content
}