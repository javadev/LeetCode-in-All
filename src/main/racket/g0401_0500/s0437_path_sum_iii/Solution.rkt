; #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree
; #LeetCode_75_Binary_Tree/DFS #Level_2_Day_7_Tree #Big_O_Time_O(n)_Space_O(n)
; #2025_02_11_Time_107_ms_(100.00%)_Space_136.84_MB_(100.00%)

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

(define/contract (path-sum root targetSum)
  (-> (or/c tree-node? #f) exact-integer? exact-integer?)
    (let recur ([root root][candidates empty])
        (if (boolean? root) 0
            (let ([new-candidates 
                  (cons (tree-node-val root)
                        (map (lambda (i) (+ i (tree-node-val root))) candidates))])
        (+ (recur (tree-node-left root) new-candidates) (recur (tree-node-right root) new-candidates)
        (foldl (lambda (i res) (+ res (if (= i targetSum) 1 0))) 0 new-candidates))))))
