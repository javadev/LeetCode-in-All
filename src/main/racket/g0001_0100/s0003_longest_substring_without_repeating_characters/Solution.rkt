; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Sliding_Window
; #Algorithm_I_Day_6_Sliding_Window #Level_2_Day_14_Sliding_Window/Two_Pointer #Udemy_Strings
; #Big_O_Time_O(n)_Space_O(1) #AI_can_be_used_to_solve_the_task
; #2025_01_28_Time_134_(75.00%)_Space_132.36_(100.00%)

; Helper function to get the sublist up to 'v' excluded.
(define (take-till q v)
  (define (take-till/helper q v acc)
    (if (or (null? q)
            (eq? (car q) v))
        acc
        (take-till/helper (cdr q) v (cons (car q) acc))))
  (foldl cons null (take-till/helper q v null)))

; (take-till '(1 2 3 4 5) 4) returns '(1 2 3)

(define (max-substr s queue len max-len)
  (cond
    [(null? s) max-len]
    [(pair? s)
     (let ((x (car s))
           (xs (cdr s)))
       (if (member x queue)
           (let* ((tqueue (take-till queue x)) ; queue from last repeated char
                 (tqueue-len (+ 1 (length tqueue))))
             (max-substr xs (cons x tqueue) tqueue-len (max tqueue-len max-len)))
           ; else
           (max-substr xs (cons x queue) (+ 1 len) (max (+ 1 len) max-len))))]))

(define/contract (length-of-longest-substring s)
  (-> string? exact-integer?)
  (max-substr (string->list s) null 0 0))
