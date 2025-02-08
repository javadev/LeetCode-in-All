; #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Depth_First_Search
; #Tree #Binary_Tree #Udemy_Tree_Stack_Queue #Top_Interview_150_Binary_Tree_General
; #Big_O_Time_O(N)_Space_O(N) #2025_02_07_Time_0_(100.00%)_Space_131.06_(100.00%)

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

(define max-box (box -inf.0))  ; Rename max to avoid conflict

(define/contract (max-path-sum root)
  (-> (or/c tree-node? #f) exact-integer?)
  (set-box! max-box -inf.0)  ; Reset max-box before calculation
  (helper root)
  (unbox max-box))  ; Return the stored max value

(define (helper node)
  (if (not node)
      0
      (let* ((left (max 0 (helper (tree-node-left node))))
             (right (max 0 (helper (tree-node-right node))))
             (current (+ (tree-node-val node) left right)))
        (when (> current (unbox max-box))  ; Correctly update max-box
          (set-box! max-box current))
        (+ (tree-node-val node) (max left right)))))  ; Choose the max path
