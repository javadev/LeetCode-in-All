; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Matrix #Backtracking
; #Algorithm_II_Day_11_Recursion_Backtracking #Top_Interview_150_Backtracking
; #Big_O_Time_O(4^(m*n))_Space_O(m*n) #2025_02_07_Time_2517_ms_(100.00%)_Space_130.64_MB_(_%)

(define/contract (exist board word)
  (-> (listof (listof char?)) string? boolean?)
  (let* ([rows (length board)]
         [cols (length (first board))]
         [word-len (string-length word)])
    
    (define (dfs board x y index)
      (if (= index word-len)
          #t
          (let ([current (list-ref (list-ref board x) y)]
                [next-char (string-ref word index)])
            (define directions '((-1 0) (1 0) (0 -1) (0 1)))  ; up down left right
            (define new-board 
              (list-set board x 
                        (list-set (list-ref board x) y #\-)))
            
            (ormap
             (λ (dir)
               (let ([new-x (+ x (first dir))]
                     [new-y (+ y (second dir))])
                 (and (>= new-x 0) (< new-x rows)
                      (>= new-y 0) (< new-y cols)
                      (char=? (list-ref (list-ref board new-x) new-y) next-char)
                      (dfs new-board new-x new-y (add1 index)))))
             directions))))
    
    (for*/or ([i (range rows)]
              [j (range cols)])
      (and (char=? (list-ref (list-ref board i) j) 
                   (string-ref word 0))
           (dfs board i j 1)))))
