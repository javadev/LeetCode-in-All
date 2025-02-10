; #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Binary_Search_Tree
; #Data_Structure_II_Day_17_Tree #Level_2_Day_9_Binary_Search_Tree
; #Top_Interview_150_Binary_Search_Tree #Big_O_Time_O(n)_Space_O(n)
; #2025_02_10_Time_27_ms_(100.00%)_Space_130.16_MB_(100.00%)

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

(define (inorder-traversal tree)
  (if (not tree)
      '()
      (append (inorder-traversal (tree-node-left tree))
              (list (tree-node-val tree))
              (inorder-traversal (tree-node-right tree)))))

(define (kth-smallest root k)
  (let ([inorder (inorder-traversal root)])
    (list-ref inorder (sub1 k))))
