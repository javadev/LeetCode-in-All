; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Backtracking
; #Algorithm_I_Day_11_Recursion_Backtracking #Level_2_Day_20_Brute_Force/Backtracking
; #Udemy_Backtracking/Recursion #Top_Interview_150_Backtracking #Big_O_Time_O(n*n!)_Space_O(n+n!)
; #2025_02_03_Time_0_ms_(100.00%)_Space_101.43_MB_(66.67%)

(define/contract (permute nums)
  (-> (listof exact-integer?) (listof (listof exact-integer?)))
  (cond [(empty? nums) (list empty)]
        [else (for/fold ([l empty])([i nums])
    (append (map (lambda (lst) (cons i lst)) (permute (remove i nums))) l)
    )
  ]))
