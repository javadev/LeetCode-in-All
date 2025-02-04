; #Medium #Top_100_Liked_Questions #Array #Backtracking #Algorithm_II_Day_10_Recursion_Backtracking
; #Level_2_Day_20_Brute_Force/Backtracking #Udemy_Backtracking/Recursion
; #Top_Interview_150_Backtracking #Big_O_Time_O(2^n)_Space_O(n+2^n)
; #2025_02_03_Time_7_(100.00%)_Space_101.91_(50.00%)

(define (create-task-rec elems target next-list result)
  (if (= 0 (length next-list)) result
      (if (< target (+ (foldl + 0 elems) (car next-list)))
          (create-task-rec elems target (cdr next-list) result)
          (create-task-rec elems target (cdr next-list)
                           (append result
                                   (list (list (append elems (list (car next-list)))
                                               next-list)))))))

(define (create-task elems target next-list)
  (create-task-rec elems target next-list (list)))

(define (dfs result task target)
  (if (= 0 (length task)) result
      (let* ([current-task (car task)]
             [new-task (create-task (car current-task)
                                     target
                                     (cadr current-task))]
             [result (if (= (foldl + 0 (car current-task)) target)
                         (append result (list (car current-task)))
                         result)]
             [task (append new-task (cdr task))])
        (dfs result task target))))

(define (start-dfs lst target) (dfs (list) (create-task (list) target lst) target))

(define/contract (combination-sum candidates target)
  (-> (listof exact-integer?) exact-integer? (listof (listof exact-integer?)))
　(start-dfs candidates target))
