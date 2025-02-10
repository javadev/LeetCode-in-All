; #Medium #Dynamic_Programming #Math #Tree #Binary_Tree #Binary_Search_Tree
; #Dynamic_Programming_I_Day_11 #Big_O_Time_O(n)_Space_O(1)
; #2025_02_04_Time_0_ms_(100.00%)_Space_101.40_MB_(100.00%)

(define/contract (num-trees n)
  (-> exact-integer? exact-integer?)
  (let loop ((i 0) (result 1))
    (if (= i n)
        (quotient result (+ n 1))
        (loop (+ i 1)
              (quotient (* result (- (* 2 n) i)) (+ i 1))))))
