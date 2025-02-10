; #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Binary_Search
; #Algorithm_II_Day_16_Dynamic_Programming #Binary_Search_II_Day_3 #Dynamic_Programming_I_Day_18
; #Udemy_Dynamic_Programming #Top_Interview_150_1D_DP #Big_O_Time_O(n*log_n)_Space_O(n)
; #2025_02_10_Time_3_ms_(100.00%)_Space_101.78_MB_(100.00%)

(require racket/list)

(define/contract (length-of-lis nums)
  (-> (listof exact-integer?) exact-integer?)
  (if (null? nums)
      0
      (let* ([dp (make-vector (+ (length nums) 1) +inf.0)]
             [left 1]
             [right 1])
        
        (for ([curr nums])
          (let ([start left]
                [end right])
            ;; Binary search for position in dp array
            (let loop ()
              (when (< (+ start 1) end)
                (let ([mid (quotient (+ start end) 2)])
                  (if (< curr (vector-ref dp mid))
                      (set! end mid)
                      (set! start mid)))
                (loop)))

            ;; Update dp array
            (cond
              [(< curr (vector-ref dp start))
               (vector-set! dp start curr)]
              [(and (> curr (vector-ref dp start))
                    (< curr (vector-ref dp end)))
               (vector-set! dp end curr)]
              [(> curr (vector-ref dp end))
               (vector-set! dp (add1 end) curr)
               (set! right (add1 right))])))

        right)))
