; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming #Greedy
; #Algorithm_II_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_4 #Udemy_Arrays
; #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(1)
; #2025_02_03_Time_0_(100.00%)_Space_132.04_(_%)

(define (can-jump L)
  (let loop ([i 0] [arr L] [best 0] [N (length L)])
    (cond ((< best i) #f)
          ((>= (+ i (car arr)) (sub1 N)) #t)
          (else
           (loop (add1 i) (cdr arr) (max best (+ i (car arr))) N)))))
