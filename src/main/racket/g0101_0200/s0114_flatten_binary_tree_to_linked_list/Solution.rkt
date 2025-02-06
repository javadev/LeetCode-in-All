; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Tree #Binary_Tree
; #Divide_and_Conquer #Data_Structure_II_Day_15_Tree #Top_Interview_150_Binary_Tree_General
; #Big_O_Time_O(N)_Space_O(N) #2025_02_05_Time_23_(100.00%)_Space_101.43_(100.00%)

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

(define/contract (flatten root)
  (-> (or/c tree-node? #f) void?)
  
  (define (find-tail root)
    (cond
      [(not root) root]
      [else
       (let ([left (tree-node-left root)]
             [right (tree-node-right root)])
         (if left
             (let ([tail (find-tail left)])
               ; Stitch right subtree below the tail
               (set-tree-node-left! root #f)
               (set-tree-node-right! root left)
               (when tail
                 (set-tree-node-right! tail right))
               ; Return final tail
               (if (and tail (tree-node-right tail))
                   (find-tail (tree-node-right tail))
                   tail))
             ; If no left subtree, current node is tail
             (if (tree-node-right root)
                 (find-tail (tree-node-right root))
                 root)))]))
  
  (when root
    (find-tail root))
  (void))
