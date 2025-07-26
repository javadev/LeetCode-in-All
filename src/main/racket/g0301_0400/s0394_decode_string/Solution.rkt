; #Medium #Top_100_Liked_Questions #String #Stack #Recursion #LeetCode_75_Stack
; #Level_1_Day_14_Stack #Udemy_Strings #Big_O_Time_O(n)_Space_O(n)
; #2025_02_11_Time_0_ms_(100.00%)_Space_101.43_MB_(100.00%)

(define/contract (decode-string s)
  (-> string? string?)
  (let-values ([(result _) (decode-helper (string->list s) 0)])
    result))

(define (decode-helper chars pos)
  (let loop ([current-pos pos]
             [count 0]
             [result ""])
    (if (>= current-pos (length chars))
        (values result current-pos)
        (let ([char (list-ref chars current-pos)])
          (cond
            ; If it's a letter, append it to result
            [(char-alphabetic? char)
             (loop (add1 current-pos)
                   count
                   (string-append result (string char)))]
            
            ; If it's a digit, update count
            [(char-numeric? char)
             (loop (add1 current-pos)
                   (+ (* count 10) (- (char->integer char) (char->integer #\0)))
                   result)]
            
            ; If it's '[', handle nested string
            [(char=? char #\[)
             (let-values ([(nested-str new-pos) (decode-helper chars (add1 current-pos))])
               (loop new-pos
                     0
                     (string-append result 
                                  (string-join 
                                   (make-list count nested-str)
                                   ""))))]
            
            ; If it's ']', return current result and position
            [(char=? char #\])
             (values result (add1 current-pos))]
            
            ; Skip other characters
            [else (loop (add1 current-pos) count result)])))))
