; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Depth_First_Search
; #Breadth_First_Search #Matrix #Union_Find
; #Algorithm_II_Day_6_Breadth_First_Search_Depth_First_Search
; #Graph_Theory_I_Day_1_Matrix_Related_Problems #Level_1_Day_9_Graph/BFS/DFS #Udemy_Graph
; #Top_Interview_150_Graph_General #Big_O_Time_O(M*N)_Space_O(M*N)
; #2025_02_08_Time_349_ms_(100.00%)_Space_134.52_MB_(100.00%)

(define-syntax vref
  (syntax-rules ()
    ((_ vec idx) (vector-ref vec idx))))

(define-syntax vlen
  (syntax-rules ()
    ((_ vec) (vector-length vec))))

(define-syntax in?
  (syntax-rules ()
    ((_ st x) (set-member? st x))))

(define (num-islands grid)
  (define g (list->vector (map list->vector grid)))

  (define (dfs i j visited)
    (cond
      [(or (< i 0) (>= i (vlen g)) (< j 0) (>= j (vlen (vref g 0)))) visited] ; if i,j is out of bounds
      [(in? visited (cons i j)) visited]
      [(equal? (vref (vref g i) j) #\0) visited]
      [else (dfs i (sub1 j) (dfs (add1 i) j (dfs i (add1 j) (dfs (sub1 i) j (set-add visited (cons i j))))))])) ; explore all 4 directions

  (for*/fold ([islands 0]
              [visited (set)]
              #:result islands)
             ([i (vlen g)]
              [j (vlen (vref g 0))])
    (match (vref (vref g i) j)
      [#\0 (values islands visited)]
      [#\1 #:when (in? visited (cons i j)) (values islands visited)]
      [#\1 (values (add1 islands) (dfs i j visited))])))
