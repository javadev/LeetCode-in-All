; #Easy #Dynamic_Programming #Bit_Manipulation #LeetCode_75_Bit_Manipulation
; #Udemy_Bit_Manipulation #Big_O_Time_O(num)_Space_O(num)
; #2025_02_11_Time_3_ms_(100.00%)_Space_135.21_MB_(100.00%)

(define (near-bit n i)
    (if (and (<= i n) (< n (* i 2)))
        i
        (near-bit n (* i 2))))

(define/contract (count-bits n)
  (-> exact-integer? (listof exact-integer?))
  (match n
      [0 '(0)]
      [1 '(0 1)]
      [else 
        (let* ([b (near-bit n 1)]
               [prev (count-bits (- b 1))]
               [next (map (lambda (n) (+ n 1)) prev)]) 
               (take (append prev next) (+ n 1)))]
      ))
