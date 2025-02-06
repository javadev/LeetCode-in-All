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

(define/contract (build-tree preorder inorder)
  (-> (listof exact-integer?) (listof exact-integer?) (or/c tree-node? #f))
  
  ; Create a hash table mapping values to their indices in inorder traversal
  (define inorder-map
    (for/hash ([val inorder]
               [idx (range (length inorder))])
      (values val idx)))
  
  ; Helper function that builds the tree recursively
  (define (build j start end)
    (if (or (> start end) 
            (>= j (length preorder)))
        #f
        (let* ([value (list-ref preorder j)]
               [index (hash-ref inorder-map value)]
               [node (tree-node value #f #f)]
               [left-subtree (build (add1 j) start (sub1 index))]
               [right-subtree (build (+ j 1 (- index start)) (add1 index) end)])
          (struct-copy tree-node node
                      [left left-subtree]
                      [right right-subtree]))))
  
  ; Start the tree building process
  (if (empty? preorder)
      #f
      (build 0 0 (sub1 (length preorder)))))
