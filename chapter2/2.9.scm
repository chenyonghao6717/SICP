; interval1: [a, b], interval2: [c, d]
; width1 = (a + b) / 2, width2 = (c + d) / 2
; sum-interval: [a + c, b + d]
; sum-width = (a + b + c + b) / 2 = width1 + width2
; opposite-interval1 = [-b, -a]
; sub-interval = [c - b, d - a]
; sub-witdh = (c + d - a - b) / 2 = width2 - width1

; mul-interval = [
;   min(ac, ad, bc, bd),
;   max(ac, ad, bc, bd)
; ]
; widths are linear functions of intervals
; choose a possible mul-interval = [ac, ad], mul-width = a(d - c) / 2, is function of a and width2, not just width1 and width2