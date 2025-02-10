; #Medium #String #Top_Interview_150_Array/String
; #2025_02_03_Time_57_ms_(100.00%)_Space_130.82_MB_(60.00%)

(define/contract (convert s numRows)
  (-> string? exact-integer? string?)
  (let* ((sLen (string-length s))
         (maxDist (- (* numRows 2) 2)))
    (if (= numRows 1)
        s
        (let ((buf ""))
          (for ([i (in-range numRows)])
            (let loop ((index i))
              (when (< index sLen)
                (set! buf (string-append buf (string (string-ref s index))))
                (let ((next-step (- maxDist (* i 2))))
                  (when (and (> i 0) (< i (- numRows 1)) (< (+ index next-step) sLen))
                    (set! buf (string-append buf (string (string-ref s (+ index next-step))))))
                  (loop (+ index maxDist))))))
          buf))))
