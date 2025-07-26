; #Medium #Top_100_Liked_Questions #String #Hash_Table #Greedy #Two_Pointers
; #Data_Structure_II_Day_7_String #Big_O_Time_O(n)_Space_O(1)
; #2025_02_12_Time_0_ms_(100.00%)_Space_101.55_MB_(100.00%)

(define/contract (partition-labels s)
  (-> string? (listof exact-integer?))
  (let* ([chars (string->list s)]
         [position (make-vector 26 0)])
    
    ; First pass: record last position of each character
    (for ([c chars]
          [i (in-range (string-length s))])
      (vector-set! position 
                   (- (char->integer c) (char->integer #\a))
                   i))
    
    ; Second pass: find partitions
    (let loop ([i 0]
               [prev -1]
               [max-pos 0]
               [result '()])
      (if (>= i (string-length s))
          (reverse result)
          (let* ([curr-char (string-ref s i)]
                 [curr-last-pos (vector-ref position 
                                          (- (char->integer curr-char) 
                                             (char->integer #\a)))]
                 [new-max (max max-pos curr-last-pos)])
            (if (= i new-max)
                (loop (add1 i)
                      i
                      new-max
                      (cons (- i prev) result))
                (loop (add1 i)
                      prev
                      new-max
                      result)))))))
