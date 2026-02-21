; We need O(nlogn) to sort the charset. Then we can choose the last 2 stuffs and merge them, then put the merged one
; back. Each merge costs O(1). Since we have n chars, we need to merge n - 1 times. The time complexity of this part
; is O(n). The overall is O(nlogn) + O(n) which is O(nlogn).
; To encode the most frequent char we need just O(1) and the least frequent one needs O(n).