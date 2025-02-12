; #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Breadth_First_Search
; #Algorithm_II_Day_18_Dynamic_Programming #Dynamic_Programming_I_Day_20
; #Level_2_Day_12_Dynamic_Programming #Top_Interview_150_1D_DP #Big_O_Time_O(m*n)_Space_O(amount)
; #2025_02_11_Time_29_ms_(100.00%)_Space_101.98_MB_(100.00%)

(define/contract (coin-change coins amount)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (let ([dp (make-vector (+ amount 1) 0)])
    (vector-set! dp 0 1)
    (for ([coin coins])
      (for ([i (in-range coin (+ amount 1))])
        (let ([prev (vector-ref dp (- i coin))])
          (when (> prev 0)
            (vector-set! dp i
                         (if (= (vector-ref dp i) 0)
                             (+ prev 1)
                             (min (vector-ref dp i) (+ prev 1))))))))
    (- (vector-ref dp amount) 1)))
