; #Easy #Top_100_Liked_Questions #Depth_First_Search #Breadth_First_Search #Tree #Binary_Tree
; #Data_Structure_I_Day_12_Tree #Level_2_Day_6_Tree #Udemy_Tree_Stack_Queue
; #Top_Interview_150_Binary_Tree_General #Big_O_Time_O(n)_Space_O(n)
; #2025_02_10_Time_0_ms_(100.00%)_Space_102.41_MB_(0.00%)

; Definition for a binary tree node.
#|
; val : integer?
; left : (or/c tree-node? #f)
; right : (or/c tree-node? #f)
(struct tree-node
  (val left right) #:mutable #:transparent)

; Helper function to create a tree node.
|#
(define (make-tree-node val [left #f] [right #f])
  (tree-node val left right))

; Function to invert a binary tree.
(define/contract (invert-tree root)
  (-> (or/c tree-node? #f) (or/c tree-node? #f))
  (cond
    [(not root) #f] ; Base case: empty tree.
    [else
     (make-tree-node
      (tree-node-val root)
      (invert-tree (tree-node-right root))
      (invert-tree (tree-node-left root)))]))
