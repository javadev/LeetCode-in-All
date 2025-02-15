; #Hard #Top_100_Liked_Questions #Array #Heap_Priority_Queue #Sliding_Window #Queue
; #Monotonic_Queue #Udemy_Arrays #Big_O_Time_O(n*k)_Space_O(n+k)
; #2025_02_15_Time_62_ms_(100.00%)_Space_137.01_MB_(100.00%)

(require racket/contract)

(define/contract (max-sliding-window nums k)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (if (= k 1)
      nums ; Special case where each window is just a single number
      (let* ([n (length nums)]
             [nums-vec (list->vector nums)]
             [capacity n]
             [dq (make-vector capacity 0)]
             [head (box 0)]
             [tail (box 0)]
             [result '()])

        ;; Helper functions for deque operations
        (define (deque-empty?) (= (unbox head) (unbox tail)))
        (define (deque-push-back! idx)
          (vector-set! dq (unbox tail) idx)
          (set-box! tail (modulo (+ (unbox tail) 1) capacity)))
        (define (deque-pop-back!)
          (set-box! tail (modulo (- (unbox tail) 1) capacity)))
        (define (deque-front) (vector-ref dq (unbox head)))
        (define (deque-pop-front!)
          (set-box! head (modulo (+ (unbox head) 1) capacity)))
        (define (deque-back)
          (vector-ref dq (if (= (unbox tail) 0) (- capacity 1) (- (unbox tail) 1))))
        (define (pop-back-while cur)
          (when (not (deque-empty?))
            (when (< (vector-ref nums-vec (deque-back)) cur)
              (deque-pop-back!)
              (pop-back-while cur))))

        ;; Iterate through nums
        (for ([idx (in-range n)])
          (let ([cur (vector-ref nums-vec idx)])
            (pop-back-while cur)
            (deque-push-back! idx)
            (when (and (>= idx k)
                       (not (deque-empty?))
                       (equal? (deque-front) (- idx k)))
              (deque-pop-front!))
            (when (>= idx (sub1 k))
              (set! result (cons (vector-ref nums-vec (deque-front)) result)))))

        (reverse result))))
