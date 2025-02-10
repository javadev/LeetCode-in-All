; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search
; #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_11 #Level_2_Day_8_Binary_Search
; #Udemy_Binary_Search #Top_Interview_150_Binary_Search #Big_O_Time_O(log_n)_Space_O(1)
; #2025_02_03_Time_0_ms_(100.00%)_Space_101.54_MB_(100.00%)

(define/contract (search nums target [index 0])
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (cond [(null? nums) -1]
        [(equal? target (car nums)) index]
        [else (search (cdr nums) target (add1 index))]))
