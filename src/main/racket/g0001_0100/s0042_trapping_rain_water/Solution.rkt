; #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming #Two_Pointers
; #Stack #Monotonic_Stack #Dynamic_Programming_I_Day_9 #Udemy_Two_Pointers
; #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(1)
; #2025_02_03_Time_0_ms_(100.00%)_Space_129.13_MB_(100.00%)

(define (trap height)
    (define H (list->vector height))
    
    (define (go water left right L R)
        (cond [(>= left right) water]
              [else 
                (cond [(<= L R) (go (+ water 
                                       (max (- (min L R)
                                               (vector-ref H (add1 left)))
                                            0))
                                    (add1 left) 
                                    right
                                    (max L (vector-ref H (add1 left)))
                                    R)]
                      [else (go (+ water 
                                   (max (- (min L R) 
                                           (vector-ref H (sub1 right)))
                                        0))
                                   left 
                                   (sub1 right)
                                   L
                                   (max R (vector-ref H (sub1 right))))])]))
    (go 0 
        0 
        (sub1 (length height)) 
        (vector-ref H 0) 
        (vector-ref H (sub1 (length height)))))
