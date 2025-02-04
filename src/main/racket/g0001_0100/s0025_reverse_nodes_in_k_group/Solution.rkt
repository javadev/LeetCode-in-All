; #Hard #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_13_Linked_List
; #Udemy_Linked_List #Top_Interview_150_Linked_List #Big_O_Time_O(n)_Space_O(k)
; #2025_02_03_Time_0_(100.00%)_Space_101.65_(100.00%)

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

(define (reverse-k l k next)
  (if (or (= 0 k) (not l)) next
      (let ([n (list-node-next l)])
        (set-list-node-next! l next)
        (reverse-k n (- k 1) l))))
		
(define (reverse-group-k h c k i)
  (cond [(= i k) (reverse-k h k (reverse-group-k c c k 0))]
        [(not c) h]
        [else (reverse-group-k h (list-node-next c) k (+ 1 i))]))
		
(define (reverse-k-group head k) (reverse-group-k head head k 0))
