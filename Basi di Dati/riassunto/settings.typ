#let hb = line(length: 100%, stroke: 0.1pt)

#let db(col, nome, ..content) = {
  show table.cell.where(y: 1): strong
  table(
    columns: col,
    fill: (x, y) => if y == 1 { (rgb("#d2d2d2")) },

    table.cell(colspan: col, align: left)[#nome],
    ..content
  )
}


#let def(content) = block(stroke: 1pt, inset: 6pt, radius: 1pt, width: 100%)[#smallcaps([def]): #content]

#let ndef(nome, content) = {
  def([*#nome*\ #content])
}

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

#let split(..content) = {
  grid(
    columns: 2,
    inset: 5pt,
    ..content
  )
}

#let u(content) = underline(content)

#let arr = $->$

#let decomp = $triangle.r triangle.l$
#let chxf = $X^+_F$
#let chaf = $A^+_F$

#let __dr = ex[Normalizzazione in TFN][
  Data la relazione $R("ACDGMPRS")$, con dipendenze funzionali
  $
        F={           \
        M-> & "RSDG", \
     "MS"-> & "CD",   \
        G-> & R,      \
        D-> & S,      \
        S-> & D,      \
    "MPD"-> & "AM"    \
          }
  $
  La decomposizione in 3FN si ottiene con l'algoritmo di normalizzazione
]
