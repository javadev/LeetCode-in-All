; #Medium #String #Dynamic_Programming #Big_O_Time_O(n^2)_Space_O(n)
; #2025_02_12_Time_7_ms_(100.00%)_Space_101.84_MB_(100.00%)

(define (check-polin vec left right)
  (cond [(< left 0) 0]
        [(>= right (vector-length vec)) 0]
        [(not (eq? (vector-ref vec left) (vector-ref vec right))) 0]
        [else (add1 (check-polin vec (sub1 left) (add1 right)))]))

(define (count-substrings s)
  (let ([vec (list->vector (string->list s))]
        [len (string-length s)])
    (apply + (for/list ([i (range len)])
           (+ 1
                (check-polin vec (sub1 i) (add1 i))
                (check-polin vec (sub1 i) i))))))
