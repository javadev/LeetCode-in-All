; #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Level_2_Day_13_Dynamic_Programming
; #Big_O_Time_O(n*sums)_Space_O(n*sums)
; #2025_02_11_Time_1098_ms_(100.00%)_Space_132.26_MB_(100.00%)

(define/contract (can-partition nums)
  (-> (listof exact-integer?) boolean?)
  (let* ([sum (apply + nums)])
    (if (odd? sum)
        #f
        (let* ([target (/ sum 2)]
               [dp (make-hash)])
          (hash-set! dp 0 #t)
          (for ([num nums])
            (for ([key (reverse (hash-keys dp))])
              (let ([new-sum (+ key num)])
                (when (<= new-sum target)
                  (hash-set! dp new-sum #t)))))
          (hash-ref dp target #f)))))
