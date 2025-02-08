; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Sorting #Two_Pointers #Linked_List
; #Divide_and_Conquer #Merge_Sort #Level_2_Day_4_Linked_List #Top_Interview_150_Divide_and_Conquer
; #Big_O_Time_O(log(N))_Space_O(log(N)) #2025_02_08_Time_31_(100.00%)_Space_132.15_(100.00%)

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

; Helper function to split the list into two halves
(define (split-list head)
  (let loop ([slow head]
             [fast head]
             [pre #f])
    (cond
      [(or (not fast) (not (list-node-next fast)))
       (when pre
         (set-list-node-next! pre #f))
       slow]
      [else
       (loop (list-node-next slow)
             (list-node-next (list-node-next fast))
             slow)])))

; Helper function to merge two sorted lists
(define (merge-lists l1 l2)
  (let ([dummy (list-node 1 #f)])
    (let loop ([curr dummy]
               [first l1]
               [second l2])
      (cond
        [(not first)
         (set-list-node-next! curr second)]
        [(not second)
         (set-list-node-next! curr first)]
        [else
         (if (<= (list-node-val first) (list-node-val second))
             (begin
               (set-list-node-next! curr first)
               (loop first (list-node-next first) second))
             (begin
               (set-list-node-next! curr second)
               (loop second first (list-node-next second))))])
      (list-node-next dummy))))

; Main sort-list function with contract
(define/contract (sort-list head)
  (-> (or/c list-node? #f) (or/c list-node? #f))
  (cond
    [(or (not head) (not (list-node-next head)))
     head]
    [else
     (let* ([middle (split-list head)]
            [first (sort-list head)]
            [second (sort-list middle)])
       (merge-lists first second))]))
