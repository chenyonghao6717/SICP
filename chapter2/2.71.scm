; Since in each merge the sum of picked 2 stuffs is still the smallest one in the charset,
; each time we pick out 2 stuffs, at least 1 stuff is a leaf. So the tree is like: the left branch
; of each subtree is a leaf and the right one is either a leaf or a subtree. so we can only use 1
; bit(0) to represent the most frequent char. In each layer is a leaf node and in the last layer
; we have 2 leaves, so we need n - 2 mid layer and 1 last layer. So we need n - 1 bits to represent
; the least frequent char.