; #Easy #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Level_2_Day_7_Tree
; #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
; #2025_02_11_Time_0_ms_(100.00%)_Space_102.61_MB_(100.00%)

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

(define/contract (diameter-of-binary-tree root)
  (-> (or/c tree-node? #f) exact-integer?)
  ; Use let/cc to simulate a mutable variable for diameter
  (let/cc return
    (let ([diameter 0])
      ; Helper function that both updates max diameter and returns height
      (define (diameter-helper node)
        (if (not node)
            0
            (let* ([left-len (if (tree-node-left node)
                                (add1 (diameter-helper (tree-node-left node)))
                                0)]
                   [right-len (if (tree-node-right node)
                                 (add1 (diameter-helper (tree-node-right node)))
                                 0)])
              ; Update diameter if current path is longer
              (set! diameter (max diameter (+ left-len right-len)))
              ; Return max height of this subtree
              (max left-len right-len))))
      
      ; Call helper function and return final diameter
      (diameter-helper root)
      diameter)))
