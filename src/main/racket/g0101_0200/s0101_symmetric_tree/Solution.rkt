; #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Breadth_First_Search
; #Tree #Binary_Tree #Data_Structure_I_Day_11_Tree #Level_2_Day_15_Tree
; #Top_Interview_150_Binary_Tree_General #Big_O_Time_O(N)_Space_O(log(N))
; #2025_02_05_Time_0_(100.00%)_Space_102.16_(_%)

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

(define/contract (is-symmetric root)
  (-> (or/c tree-node? #f) boolean?)
   (define (two-symmetric? left right)
    (cond
        [(and (not left) (not right )) #t]
        [(and left (not right )) #f]
        [(and (not left) right) #f]
        [(not (equal? (tree-node-val left) (tree-node-val right))) #f]
        [else 
            (and (two-symmetric? (tree-node-left left) (tree-node-right right))
                 (two-symmetric? (tree-node-right left) (tree-node-left right)))]))
  (two-symmetric? (tree-node-left root) (tree-node-right root)))
