; #Easy #Math #Udemy_Integers #Top_Interview_150_Math #Big_O_Time_O(log10(x))_Space_O(1)
; #2025_02_03_Time_8_ms_(100.00%)_Space_129.01_MB_(88.24%)

(define/contract (is-palindrome x)
  (-> exact-integer? boolean?)
  (if (< x 0)
      #f
      (let loop ((localX x) (rev 0))
        (if (= localX 0)
            (= rev x)
            (loop (quotient localX 10) (+ (* rev 10) (remainder localX 10)))))))
