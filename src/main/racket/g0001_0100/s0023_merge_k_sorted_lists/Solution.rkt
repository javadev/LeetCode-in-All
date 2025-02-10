; #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Heap_Priority_Queue #Linked_List
; #Divide_and_Conquer #Merge_Sort #Top_Interview_150_Divide_and_Conquer
; #Big_O_Time_O(k*n*log(k))_Space_O(log(k))
; #2025_02_03_Time_306_ms_(100.00%)_Space_130.68_MB_(100.00%)

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

(define/contract (merge-k-lists lists)
  (-> (listof (or/c list-node? #f)) (or/c list-node? #f))
  (define (merge-two-lists l1 l2)
    (cond
      [(not l1) l2]
      [(not l2) l1]
      [(< (list-node-val l1) (list-node-val l2))
       (set-list-node-next! l1 (merge-two-lists (list-node-next l1) l2))
       l1]
      [else
       (set-list-node-next! l2 (merge-two-lists l1 (list-node-next l2)))
       l2]))
  
  (define (merge lists)
    (cond
      [(empty? lists) #f]
      [(= (length lists) 1) (car lists)]
      [else
       (merge-two-lists (car lists) (merge (cdr lists)))]))
  
  (merge lists)
  )
