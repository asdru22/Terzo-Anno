#let hb = line(length: 100%, stroke: 0.1pt)

#let db(col, nome, ..content) = {
  show table.cell.where(y: 1): strong
  table(
    columns: col,
    fill: (x, y) => if y == 1 { (rgb("#d2d2d2")) },

    table.cell(colspan: 3, align: left)[#nome],
    ..content
  )
}

#let def(content) = block(stroke: 1pt, inset: 6pt, radius: 1pt, width: 100%)[#smallcaps([def]): #content]

#let ex(nome, content) = block(
  stroke: 1pt,
  inset: 6pt,
  radius: 5pt,
  width: 100%,
)[#smallcaps([ex]): #nome \ #v(1pt) #content]

#let imp(content) = block(stroke: 2pt + red, inset: 7pt, width: 100%)[#content]

#let null = { smallcaps("null") }

#let eacc = "È"

#let tab(cols, titolo, ..content) = {
  figure(table(
    inset: 5pt,
    columns: cols,
    align: left,
    table.cell(colspan: cols, align: center, text(weight: "bold", titolo)),
    ..content
  ))
}
