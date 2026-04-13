
#let bwp-red = rgb("#8B1A1A")

= Appendix: Opportunity Worksheet

For every serious opportunity, fill this out before building:

#set text(size: 10pt)
#v(12pt)

#let ws(label) = {
  text(weight: "medium")[*#label*]
  h(8pt)
  box(width: 1fr, repeat[#text(fill: luma(180))[.]])
  v(10pt)
}

#ws[Working name]
#ws[Buyer]
#ws[Pain]
#ws[Current workaround]
#ws[Trigger moment]
#ws[Wedge]
#ws[Why now]
#ws[Path to money]
#ws[Fastest way to test]
#ws[Main risk]
#ws[Build / Backlog / Kill]

#v(16pt)
#line(length: 100%, stroke: 1.2pt + bwp-red)
#v(6pt)
#text(weight: "medium")[If you cannot complete this in plain English, the idea is still too fuzzy.]
