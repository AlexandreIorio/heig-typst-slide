#let font_size = 18pt
#let heading1 = 48pt
#let heading2 = 36pt
#let heading3 = 30pt
#let heading4 = 24pt
#let heading5 = 20pt

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

  content
}
