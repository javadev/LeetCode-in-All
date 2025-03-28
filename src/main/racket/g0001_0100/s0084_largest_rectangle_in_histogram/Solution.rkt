; #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Stack #Monotonic_Stack
; #Big_O_Time_O(n_log_n)_Space_O(log_n) #2025_02_12_Time_18_ms_(100.00%)_Space_132.44_MB_(100.00%)

(define/contract (largest-rectangle-area heights)
  (-> (listof exact-integer?) exact-integer?)
  (let* ((n (length heights))
         (heights-vec (list->vector (append heights '(0))))
         (stack '())
         (max-area 0))
    
    (for ([i (in-range (add1 n))])
      (let loop ()
        (when (and (not (null? stack))
                   (<= (vector-ref heights-vec i) (vector-ref heights-vec (car stack))))
          (let* ((top (car stack))
                 (new-stack (cdr stack))
                 (height (vector-ref heights-vec top))
                 (width (if (null? new-stack) i (- i (car new-stack) 1)))
                 (area (* height width)))
            (set! max-area (max max-area area))
            (set! stack new-stack)
            (loop))))
      (set! stack (cons i stack)))

    max-area))
