; #Medium #Top_Interview_Questions #Math #Udemy_Integers
; #2025_02_03_Time_204_(100.00%)_Space_101.45_(100.00%)

(define/contract (reverse x)
  (-> exact-integer? exact-integer?)
  (let loop ((x x) (rev 0))
    (if (= x 0)
        (if (or (> rev (sub1 (expt 2 31))) (< rev (- (expt 2 31))))
            0
            rev)
        (loop (quotient x 10) (+ (* rev 10) (remainder x 10))))))
