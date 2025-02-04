; #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Greedy
; #Algorithm_II_Day_13_Dynamic_Programming #Dynamic_Programming_I_Day_4
; #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(1)
; #2025_02_03_Time_631_(100.00%)_Space_132.16_(100.00%)

(define (init-vec len)
  (let ([prepare-vec (make-vector len 99999)])
    (begin (vector-set! prepare-vec 0 0) prepare-vec)))

(define (set-cost! vec p elem)
  (if (= elem 0) vec
      (let* ([p-cost (vector-ref vec p)]
             [now-cost (add1 p-cost)]
             [target-cost (vector-ref vec (+ p elem))])
        (begin (vector-set! vec (+ p elem) (min now-cost target-cost))
               (set-cost! vec p (- elem 1))))))

(define (simple-dp cache p steps)
  (if (= 0 (length steps)) (vector-ref cache (- p 1))
      (simple-dp (set-cost! cache p (car steps)) (add1 p) (cdr steps))))

(define (start-dp steps) (simple-dp (init-vec 200000) 0 steps))

(define/contract (jump nums)
  (-> (listof exact-integer?) exact-integer?)
  (start-dp nums))
