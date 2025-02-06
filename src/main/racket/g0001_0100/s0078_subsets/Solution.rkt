; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Bit_Manipulation #Backtracking
; #Algorithm_II_Day_9_Recursion_Backtracking #Udemy_Backtracking/Recursion
; #Big_O_Time_O(2^n)_Space_O(n*2^n) #2025_02_04_Time_0_(100.00%)_Space_101.30_(100.00%)

(define/contract (subset-recur nums ans)
  (-> (listof exact-integer?) (listof (listof exact-integer?)) (listof (listof exact-integer?)))
   (cond [(empty? nums) ans]
         [else (let ([curr (map (lambda (x) (cons (first nums) x)) ans)])
    (subset-recur (rest nums) (append ans curr)))]))

(define/contract (subsets nums)
  (-> (listof exact-integer?) (listof (listof exact-integer?)))
  (subset-recur nums (list empty)))
