; #Easy #Math #Udemy_Integers #Top_Interview_150_Math
; #2025_02_03_Time_8_(100.00%)_Space_129.01_(88.24%)

(define/contract (is-palindrome x)
  (-> exact-integer? boolean?)
  (if (< x 0)
      #f
      (let loop ((localX x) (rev 0))
        (if (= localX 0)
            (= rev x)
            (loop (quotient localX 10) (+ (* rev 10) (remainder localX 10)))))))
