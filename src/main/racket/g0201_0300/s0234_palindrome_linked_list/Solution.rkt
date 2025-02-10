; #Easy #Top_100_Liked_Questions #Two_Pointers #Stack #Linked_List #Recursion
; #Level_2_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
; #2025_02_10_Time_69_ms_(100.00%)_Space_130.91_MB_(100.00%)

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

(define (linked-list->numbers ll)
  (if (not (list-node? ll))
      '()
      (append (list (list-node-val ll))
              (linked-list->numbers (list-node-next ll)))))


(define (is-palindrome head)
  (let ([numls (linked-list->numbers head)])
    (equal? numls (reverse numls))))
