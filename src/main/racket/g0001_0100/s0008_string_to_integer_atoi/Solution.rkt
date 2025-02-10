; #Medium #Top_Interview_Questions #String
; #2025_02_03_Time_3_ms_(100.00%)_Space_101.64_MB_(100.00%)

(define/contract (my-atoi s)
  (-> string? exact-integer?)
  (let* ((trimmed (string-trim s))
         (len (string-length trimmed)))
    (if (zero? len)
        0
        (let loop ((i 0) (neg? #f) (num 0) (started? #f))
          (cond
            ((= i len) num)
            ((and (not started?) (char-whitespace? (string-ref trimmed i))) (loop (+ i 1) neg? num started?))
            ((and (not started?) (char=? (string-ref trimmed i) #\+)) (loop (+ i 1) neg? num #t))
            ((and (not started?) (char=? (string-ref trimmed i) #\-)) (loop (+ i 1) #t num #t))
            ((char-numeric? (string-ref trimmed i))
             (let* ((digit (- (char->integer (string-ref trimmed i)) (char->integer #\0)))
                    (digit (if neg? (- digit) digit))
                    (next-num (+ (* num 10) digit)))
               (cond
                 ((> next-num (sub1 (expt 2 31))) (sub1 (expt 2 31)))
                 ((< next-num (- (expt 2 31))) (- (expt 2 31)))
                 (else (loop (+ i 1) neg? next-num #t)))))
            (else num))))))
