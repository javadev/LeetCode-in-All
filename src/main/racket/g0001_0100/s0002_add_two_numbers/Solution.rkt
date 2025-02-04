; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Math #Linked_List #Recursion
; #Data_Structure_II_Day_10_Linked_List #Programming_Skills_II_Day_15
; #Big_O_Time_O(max(N,M))_Space_O(max(N,M)) #AI_can_be_used_to_solve_the_task
; #2025_01_28_Time_0_(100.00%)_Space_128.42_(12.50%)

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

(define/contract (add-two-numbers l1 l2)
  (-> (or/c list-node? #f) (or/c list-node? #f) (or/c list-node? #f))
  (add-two-numbers-help l1 l2 0)
  )

(define (add-two-numbers-help l1 l2 carry-sum)
    (cond
        [(and (false? l1) (false? l2)) (if (zero? carry-sum) #f (list-node carry-sum #f))]
        [(false? l1) (list-node (modulo (+ (list-node-val l2) carry-sum) 10) (add-two-numbers-help l1 (list-node-next l2) (/ (- (+ (list-node-val l2) carry-sum) (modulo (+ (list-node-val l2) carry-sum) 10)) 10)))]
        [(false? l2) (list-node (modulo (+ (list-node-val l1) carry-sum) 10) (add-two-numbers-help (list-node-next l1) l2 (/ (- (+ (list-node-val l1) carry-sum) (modulo (+ (list-node-val l1) carry-sum) 10)) 10)))]
        [else (list-node (modulo (+ (list-node-val l1) (list-node-val l2) carry-sum) 10) (add-two-numbers-help (list-node-next l1) (list-node-next l2) (/ (- (+ (list-node-val l1) (list-node-val l2) carry-sum) (modulo (+ (list-node-val l1) (list-node-val l2) carry-sum) 10)) 10)))]
    )
)
