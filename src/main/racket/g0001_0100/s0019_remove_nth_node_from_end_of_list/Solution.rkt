; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Two_Pointers #Linked_List
; #Algorithm_I_Day_5_Two_Pointers #Level_2_Day_3_Linked_List #Top_Interview_150_Linked_List
; #Big_O_Time_O(L)_Space_O(L) #2025_02_03_Time_0_ms_(100.00%)_Space_101.91_MB_(_%)

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

(define (numbers->linked-list numbers)
  (if (empty? numbers) #f (foldr list-node #f numbers)))

(define (drop-nth-right ls n)
  (append (take ls (- (length ls) n))
          (take-right ls (sub1 n))))

(define (remove-nth-from-end head n)
  (numbers->linked-list (drop-nth-right (linked-list->numbers head) n)))
