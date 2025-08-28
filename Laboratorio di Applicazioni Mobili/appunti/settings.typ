#let template(title, doc) = {
  set text(lang: "en")
  set heading(numbering: "1.1")
  set page(numbering: "1")
  show table.cell.where(y: 0): strong
  show raw: it => {
    box(it, fill: luma(240), inset: (x: 3pt, y: 0pt), outset: (y: 3pt), radius: 2pt, width: if it.block {
      100%
    } else { auto })
  }
  show raw.where(block: true): set raw(lang: "kotlin")
  show link: it => text(fill: blue, underline(it))
  align(center, text(size: 24pt, weight: "bold", title))

  outline(depth: 1)
  doc
}

#let null = `null`

#let split(..content) = grid(columns: 2, inset: 2pt,..content)
