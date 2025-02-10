; #Medium #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_II_Day_2_Binary_Search
; #Binary_Search_I_Day_12 #Udemy_Binary_Search #Top_Interview_150_Binary_Search
; #Big_O_Time_O(log_N)_Space_O(log_N) #2025_02_08_Time_0_ms_(100.00%)_Space_101.65_MB_(100.00%)

(define/contract (find-min nums)
  (-> (listof exact-integer?) exact-integer?)
  (letrec
      ([find-min-util
        (lambda (nums l r)
          (if (= l r)
              (list-ref nums l)
              (let* ([mid (quotient (+ l r) 2)]
                     [mid-val (list-ref nums mid)]
                     [left-val (if (> mid 0) (list-ref nums (- mid 1)) +inf.0)]
                     [right-val (list-ref nums r)])
                (cond
                  [(and (= mid l) (< mid-val right-val)) (list-ref nums l)]
                  [(and (>= (- mid 1) 0) (> left-val mid-val)) mid-val]
                  [(< mid-val (list-ref nums l)) (find-min-util nums l (- mid 1))]
                  [(> mid-val right-val) (find-min-util nums (+ mid 1) r)]
                  [else (find-min-util nums l (- mid 1))]))))])
    (find-min-util nums 0 (- (length nums) 1))))
