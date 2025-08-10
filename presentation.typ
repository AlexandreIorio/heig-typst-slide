#import "template/template.typ": apply_presentation
#show: apply_presentation.with(
  title: "Heig-VD Typst Slide Template",
  subtitle: "A template for creating slides with Typst",
  authors: "Alexandre Iorio",
)

== Heading
=== Slide Title 1
==== Slide Title 2
#lorem(50)

== Code Example
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

== Quote Example
#quote(attribution: "This is a quote from a famous person.")[
  "Why doing things tomorrow when you can do them the day after tomorrow?"
]

== Image Example
#align(center)[
  #image("template/img/image.png")
]

