; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Math
; #Combinatorics #LeetCode_75_DP/Multidimensional #Algorithm_II_Day_13_Dynamic_Programming
; #Dynamic_Programming_I_Day_15 #Level_1_Day_11_Dynamic_Programming
; #Big_O_Time_O(m*n)_Space_O(m*n) #2025_02_03_Time_6_ms_(100.00%)_Space_102.66_MB_(100.00%)

(define (calc-path! start end direction cache other-p)
  (begin (if (string=? direction "v")
      (for ([i (in-range start end)])
        (if (= other-p 0)
            (hash-set! cache (list 0 i) 1)
            (hash-set! cache
                       (list other-p i)
                       (+ (hash-ref cache (list (- other-p 1) i))
                          (hash-ref cache (list other-p (- i 1)))))))
      (for ([i (in-range start end)])
        (if (= other-p 0)
            (hash-set! cache (list i 0) 1)
            (hash-set! cache (list i other-p)
                       (+ (hash-ref cache (list i (- other-p 1)))
                          (hash-ref cache (list (- i 1) other-p)))))))
         cache))

(define (dp-path x y target-x target-y cache)
  (if (and (>= x target-x) (>= y target-y))
      (hash-ref cache (list (- target-x 1) (- target-y 1)))
      (let* ([cache
              (begin
                (when (<= x target-x) (calc-path! x (add1 target-x) "h" cache y))
                (when (<= y target-x) (calc-path! y (add1 target-y) "v" cache x))
                cache)]
             [x (if (< x target-x) (add1 x) x)]
             [y (if (< y target-y) (add1 y) y)])
        (dp-path x y target-x target-y cache))))

(define (start-dp target-x target-y)
 (dp-path 0 0 target-x target-y (make-hash)))


(define/contract (unique-paths m n)
  (-> exact-integer? exact-integer? exact-integer?)
  (start-dp m n))
