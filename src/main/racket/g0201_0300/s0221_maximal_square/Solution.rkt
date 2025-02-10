; #Medium #Array #Dynamic_Programming #Matrix #Dynamic_Programming_I_Day_16
; #Top_Interview_150_Multidimensional_DP #Big_O_Time_O(m*n)_Space_O(m*n)
; #2025_02_10_Time_426_ms_(100.00%)_Space_130.80_MB_(100.00%)

(define/contract (maximal-square matrix)
  (-> (listof (listof char?)) exact-integer?)
  (let* ([m (length matrix)]
         [n (if (zero? m) 0 (length (first matrix)))]
         [dp (make-hash)]  ; Hash table to simulate a 2D array
         [max-size 0])

    (define (get-dp i j)
      (hash-ref dp (cons i j) 0))  ; Default to 0 if not found

    ;; Iterate over the matrix
    (for ([i (in-range m)])
      (for ([j (in-range n)])
        (when (char=? (list-ref (list-ref matrix i) j) #\1)
          (let* ([min-neighbor (min (get-dp i j) (get-dp (+ i 1) j) (get-dp i (+ j 1)))]
                 [size (+ 1 min-neighbor)])
            (hash-set! dp (cons (+ i 1) (+ j 1)) size)
            (set! max-size (max max-size size))))))

    (* max-size max-size)))  ; Return area of the largest square
