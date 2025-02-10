; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
; #Backtracking #Algorithm_II_Day_11_Recursion_Backtracking #Udemy_Backtracking/Recursion
; #Top_Interview_150_Backtracking #Big_O_Time_O(2^n)_Space_O(n)
; #2025_02_03_Time_3_ms_(100.00%)_Space_101.96_MB_(100.00%)

(define (generate-parenthesis n)
  (let ([res '()])
    (let loop ([opening 0] [closing 0] [path ""])
      (cond ((and (= opening n) (= closing n))
             (set! res (cons path res)))
          (else
            (when (< opening n)
              (loop (add1 opening) closing (string-append path "(")))
            (when (< closing opening)
              (loop opening (add1 closing) (string-append path ")")))))
      res)))
