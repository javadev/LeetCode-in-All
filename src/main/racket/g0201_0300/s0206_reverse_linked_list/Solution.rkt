; #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Linked_List #Recursion
; #LeetCode_75_LinkedList #Data_Structure_I_Day_8_Linked_List
; #Algorithm_I_Day_10_Recursion_Backtracking #Level_1_Day_3_Linked_List #Udemy_Linked_List
; #Big_O_Time_O(N)_Space_O(1) #2025_02_08_Time_0_ms_(100.00%)_Space_102.22_MB_(100.00%)

; Definition for singly-linked list:
#|

; val : integer?
; next : (or/c list-node? #f)
(struct list-node
  (val next) #:mutable #:transparent)

; constructor
(define (make-list-node [val 0])
  (list-node val #f))

|#
(define (reverse-list head)
  (define (rev ll prev)
    (match ll
      [#f prev]
      [(list-node val next) (rev next (list-node val prev))]))
  (rev head #f))
