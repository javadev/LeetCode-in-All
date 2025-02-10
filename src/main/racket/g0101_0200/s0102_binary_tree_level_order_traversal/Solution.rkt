; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Breadth_First_Search #Tree
; #Binary_Tree #Data_Structure_I_Day_11_Tree #Level_1_Day_6_Tree #Udemy_Tree_Stack_Queue
; #Top_Interview_150_Binary_Tree_BFS #Big_O_Time_O(N)_Space_O(N)
; #2025_02_05_Time_0_ms_(100.00%)_Space_102.22_MB_(40.00%)

; Definition for a binary tree node.
#|

; val : integer?
; left : (or/c tree-node? #f)
; right : (or/c tree-node? #f)
(struct tree-node
  (val left right) #:mutable #:transparent)

; constructor
(define (make-tree-node [val 0])
  (tree-node val #f #f))

|#

(define (make-level-table table level node)
  (if node
      (let* ([table (hash-update table level
                                 (lambda (lst) (cons (tree-node-val node) lst))
                                 '())]
             [table (make-level-table table (add1 level) (tree-node-right node))])
        (make-level-table table (add1 level) (tree-node-left node)))
      table))

(define/contract (level-order root)
  (-> (or/c tree-node? #f) (listof (listof exact-integer?)))
  (let ([table (make-level-table (hasheqv) 0 root)])
    (for/list ([level (in-range (hash-count table))])
              (hash-ref table level))))
