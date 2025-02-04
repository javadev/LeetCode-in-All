; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Greedy #Two_Pointers
; #Algorithm_II_Day_4_Two_Pointers #Top_Interview_150_Two_Pointers #Big_O_Time_O(n)_Space_O(1)
; #2025_02_03_Time_32_(100.00%)_Space_130.58_(100.00%)

(define/contract (max-area height)
  (-> (listof exact-integer?) exact-integer?)
    
    (define h (list->vector height))
    (define (helper left right)
        (cond [(>= left right) 0]
              [else (let ([area (* (min (vector-ref h left) (vector-ref h right)) (- right left))])
                        (max area
                            (if (< (vector-ref h left) (vector-ref h right))
                                (helper (add1 left) right)
                                (helper left (sub1 right)))))]))
                                
    (helper 0 (sub1 (vector-length h)))
  )
