; #Medium #Top_100_Liked_Questions #String #Dynamic_Programming
; #Algorithm_II_Day_17_Dynamic_Programming #Dynamic_Programming_I_Day_19
; #Udemy_Dynamic_Programming #Big_O_Time_O(n*m)_Space_O(n*m)
; #2025_02_12_Time_110_ms_(100.00%)_Space_141.77_MB_(100.00%)

(define (dp-ref dp i j)
  (vector-ref (vector-ref dp i) j))
(define (dp-set! dp i j val)
  (vector-set! (vector-ref dp i) j val))

(define (longest-common-subsequence text1 text2)
  (begin
    (define dp (make-vector (+ (string-length text1) 1)))
    (for ([i (+ (string-length text1) 1)])
      (vector-set! dp i (make-vector (+ (string-length text2) 1))))
    (for ([s1 text1]
          [i (string-length text1)])
      (for ([s2 text2]
            [j (string-length text2)])
        (if (eq? s1 s2)
            (dp-set! dp (add1 i) (add1 j) (add1 (dp-ref dp i j)))
            (dp-set! dp (add1 i) (add1 j) (max (dp-ref dp (add1 i) j) (dp-ref dp i (add1 j)))))))
    (dp-ref dp (string-length text1) (string-length text2))))
