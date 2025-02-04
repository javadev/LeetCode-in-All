; #Easy #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_I_Day_1_Binary_Search
; #Binary_Search_I_Day_2 #Top_Interview_150_Binary_Search #Big_O_Time_O(log_n)_Space_O(1)
; #2025_02_03_Time_0_(100.00%)_Space_102.38_(_%)

(define (search-insert nums target [low 0] [high (sub1 (length nums))])
(if (< high low)
    low
    (let ([mid (floor (/ (+ low high) 2))])
    (if (>= (list-ref nums mid) target)
        (search-insert nums target low (sub1 mid))
        (search-insert nums target (add1 mid) high)))))
