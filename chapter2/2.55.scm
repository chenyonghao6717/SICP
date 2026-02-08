; (car ''abracadabra) is equivalent to (quote (quote abracadabra))
; the first quote make the following part as a literal list with 2 parts: word quote and abracadabra
; so applying car to that list returns the word quote