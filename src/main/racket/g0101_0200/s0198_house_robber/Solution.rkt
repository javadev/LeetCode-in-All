; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
; #Algorithm_I_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_3
; #Level_2_Day_12_Dynamic_Programming #Udemy_Dynamic_Programming #Top_Interview_150_1D_DP
; #Big_O_Time_O(n)_Space_O(n) #2025_02_08_Time_0_(100.00%)_Space_101.46_(100.00%)

(define/contract (rob nums)
  (-> (listof exact-integer?) exact-integer?)
  (let ([n (length nums)])
    (cond [(= n 1) (first nums)]
          [(= n 2) (max (first nums) (second nums))]
          [(= n 3) (max (+ (first nums) (third nums)) (second nums))]
          [else
           (let-values ([(a b c d)
           (for/fold ([dp0 (first nums)]
                      [dp1 (max (first nums) (second nums))]
                      [dp2 (max (+ (first nums) (third nums)) (second nums))]
                      [prev-elem (third nums)])
            ([i (cdddr nums)])
             (values dp1 dp2 (max (+ i dp1) (+ prev-elem dp0)) i))])
             c)
  ])))
