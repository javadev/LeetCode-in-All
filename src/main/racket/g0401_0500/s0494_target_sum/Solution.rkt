; #Medium #Array #Dynamic_Programming #Backtracking #Big_O_Time_O(n*(sum+s))_Space_O(n*(sum+s))
; #2025_02_11_Time_1_ms_(100.00%)_Space_101.46_MB_(100.00%)

(define/contract (find-target-sum-ways nums target)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (if (null? nums)
      0  ; Handle empty list case
      (let* ([total-sum (apply + nums)]
             [sum (- total-sum target)])
        (if (or (negative? sum) (odd? sum))
            0
            (solve nums (quotient sum 2))))))

(define (solve nums target)
  (if (null? nums)
      0
      (let* ([first-num (car nums)]
             ; Initialize prev array with proper size
             [prev (make-vector (add1 target) 0)])
        
        ; Handle base cases for first number
        (vector-set! prev 0 
                     (if (zero? first-num) 2 1))
        (when (and (not (zero? first-num))
                   (<= first-num target))
          (vector-set! prev first-num 1))
        
        ; Process rest of the numbers
        (for ([num (in-list (cdr nums))])
          (let ([curr (make-vector (add1 target) 0)])
            (for ([j (in-range (add1 target))])
              (let ([taken (if (>= j num)
                              (vector-ref prev (- j num))
                              0)]
                    [non-taken (vector-ref prev j)])
                (vector-set! curr j (+ taken non-taken))))
            ; Update prev for next iteration
            (for ([j (in-range (add1 target))])
              (vector-set! prev j (vector-ref curr j)))))
        
        ; Return final result
        (vector-ref prev target))))
