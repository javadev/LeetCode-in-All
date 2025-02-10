; #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
; #Data_Structure_I_Day_3_Array #Dynamic_Programming_I_Day_7 #Level_1_Day_5_Greedy #Udemy_Arrays
; #Top_Interview_150_Array/String #Big_O_Time_O(N)_Space_O(1)
; #2025_02_05_Time_7_ms_(100.00%)_Space_131.60_MB_(50.00%)

(define/contract (max-profit prices)
  (-> (listof exact-integer?) exact-integer?)
  (if (empty? prices)
      0
      (let-values ([(final-profit _)
                    (for/fold ([max-profit 0]
                              [min-price (first prices)])
                             ([price (in-list (rest prices))])
                      (if (> price min-price)
                          (values (max max-profit (- price min-price))
                                 min-price)
                          (values max-profit price)))])
        final-profit)))
