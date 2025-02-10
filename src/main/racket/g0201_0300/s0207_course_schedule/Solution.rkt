; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search
; #Breadth_First_Search #Graph #Topological_Sort #Top_Interview_150_Graph_General
; #Big_O_Time_O(N)_Space_O(N) #2025_02_10_Time_4_ms_(100.00%)_Space_101.62_MB_(100.00%)

(define (can-finish num-courses prereqs)
  (let ([adj (make-hash)]
        [seen (make-vector num-courses 0)])
    (for ([x prereqs])
      (hash-set! adj (first x)
                 (cons (second x) (hash-ref adj (first x) '()))))
   
    (define (dfs node)
      (cond ((= 1 (vector-ref seen node)) #f)
            ((= 2 (vector-ref seen node)) #t)
            (else
             (vector-set! seen node 1)
             (if (andmap dfs (hash-ref adj node '()))         
                 (begin
                   (vector-set! seen node 2)
                   #t)
                 #f))))

    (andmap dfs (hash-keys adj))))
