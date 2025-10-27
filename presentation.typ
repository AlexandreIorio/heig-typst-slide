#import "template/template.typ": *

#show: apply_presentation.with(
  title: "Heig-VD Typst Slide Template",
  subtitle: "A template for creating slides with Typst",
  authors: "Alexandre Iorio",
)

#slide[
  = Title 1
  #lorem(30)

  #toolbox.pdfpc.speaker-note(
    "This is a speaker note for Title 1 slide.",
  )
  #show: later
  This is some additional content that will appear later.
]
== Title 2
#lorem(30)
=== Title 3
#lorem(20)
==== Title 4
#lorem(10)
===== Title 5
#lorem(5)
=== Code Example 1
```java
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```
#pagebreak()
=== Code Example 2
This is a code inside a text: `System.out.println("Hello, World!");`

=== Quote Example
#quote(attribution: "This is a quote from a famous person.")[
  Why doing things tomorrow when you can do them the day after tomorrow?
]

=== Image Example
#align(center)[
  #image("template/img/image.png", height: 10cm)
]

