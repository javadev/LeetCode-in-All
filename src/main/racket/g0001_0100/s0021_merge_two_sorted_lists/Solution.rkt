; #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Linked_List #Recursion
; #Data_Structure_I_Day_7_Linked_List #Algorithm_I_Day_10_Recursion_Backtracking
; #Level_1_Day_3_Linked_List #Udemy_Linked_List #Top_Interview_150_Linked_List
; #Big_O_Time_O(m+n)_Space_O(m+n) #2025_02_03_Time_0_ms_(100.00%)_Space_102.38_MB_(66.67%)

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

(define/contract (merge-two-lists list1 list2)
  (-> (or/c list-node? #f) (or/c list-node? #f) (or/c list-node? #f))
  (cond 
    [(not list1) list2]
    [(not list2) list1]
    [(< (list-node-val list1) (list-node-val list2)) (list-node (list-node-val list1) (merge-two-lists (list-node-next list1) list2))]
    [else (list-node (list-node-val list2) (merge-two-lists (list-node-next list2) list1))]
  )
  )
