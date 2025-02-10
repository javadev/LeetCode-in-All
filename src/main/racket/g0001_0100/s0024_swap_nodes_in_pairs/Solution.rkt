; #Medium #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_12_Linked_List
; #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
; #2025_02_03_Time_0_ms_(100.00%)_Space_101.59_MB_(100.00%)

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

(define (swap-pairs head)
  (let ([dummy (list-node 0 head)])
    (begin
        (set-list-node-next! dummy head)
        (let loop ([cur head]        
                  [prev dummy])
          (cond 
                [(or (eq? cur #f) (eq? (list-node-next cur) #f)) #f]
                [else (begin
                   (set-list-node-next! prev (list-node-next cur))
                   (set-list-node-next! cur (list-node-next (list-node-next cur)))
                   (set-list-node-next! (list-node-next prev) cur)

                   (loop (list-node-next cur) cur))]))
        (list-node-next dummy))))
