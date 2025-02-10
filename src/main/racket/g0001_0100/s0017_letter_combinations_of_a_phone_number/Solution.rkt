; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Backtracking
; #Algorithm_II_Day_11_Recursion_Backtracking #Udemy_Backtracking/Recursion
; #Top_Interview_150_Backtracking #Big_O_Time_O(4^n)_Space_O(n)
; #2025_02_03_Time_0_ms_(100.00%)_Space_102.48_MB_(_%)

(define (letter-combinations digits)
  (let* ((letters (vector "" "" "abc" "def" "ghi" "jkl" "mno" "pqrs" "tuv" "wxyz"))
         (letters2 (map string->list
                        (map (lambda (x) (vector-ref letters x))
                             (map (lambda (y) (string->number (make-string 1 y)))
                                  (string->list digits))))))
    (if (string=? "" digits)
        '()
        (map list->string (apply cartesian-product letters2)))))
