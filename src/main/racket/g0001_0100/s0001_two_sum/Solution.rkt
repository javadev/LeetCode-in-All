; #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table
; #Data_Structure_I_Day_2_Array #Level_1_Day_13_Hashmap #Udemy_Arrays #Top_Interview_150_Hashmap
; #Big_O_Time_O(n)_Space_O(n) #AI_can_be_used_to_solve_the_task
; #2025_02_05_Time_0_(100.00%)_Space_102.04_(40.82%)

(define (two-sum-iter nums target hash index)
  (cond
    ((null? nums) '())
    ((hash-has-key? hash (car nums) ) (list (hash-ref hash (car nums) ) index ) )
    (else (two-sum-iter (cdr nums) target (hash-set hash (- target (car nums ) ) index ) (+ index 1) ))
  )
)

(define/contract (two-sum nums target)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
    (two-sum-iter nums target (make-immutable-hash) 0)
)
