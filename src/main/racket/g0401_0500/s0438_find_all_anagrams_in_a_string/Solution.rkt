; #Medium #Top_100_Liked_Questions #String #Hash_Table #Sliding_Window
; #Algorithm_II_Day_5_Sliding_Window #Programming_Skills_II_Day_12
; #Level_1_Day_12_Sliding_Window/Two_Pointer #Big_O_Time_O(n+m)_Space_O(1)
; #2025_02_11_Time_57_ms_(100.00%)_Space_131.96_MB_(100.00%)

(define/contract (find-anagrams s p)
  (-> string? string? (listof exact-integer?))
  
  ; Initialize character frequency map for pattern p
  (let ([char-map (make-vector 26 0)])
    ; Fill the character map with pattern frequencies
    (for ([c (string->list p)])
      (vector-set! char-map 
                   (- (char->integer c) (char->integer #\a))
                   (add1 (vector-ref char-map (- (char->integer c) (char->integer #\a))))))
    
    ; Helper function to check if current window is an anagram
    (define (is-anagram? map)
      (for/and ([count (in-vector map)])
        (zero? count)))
    
    ; Main sliding window loop
    (let loop ([i 0]           ; Current position
               [j 0]           ; Window start
               [curr-map char-map]
               [result '()])
      (if (>= i (string-length s))
          (reverse result)
          (let* ([curr-char (string-ref s i)]
                 [curr-idx (- (char->integer curr-char) (char->integer #\a))]
                 ; Update map with current character
                 [new-map (let ([temp-map (vector-copy curr-map)])
                           (vector-set! temp-map curr-idx (sub1 (vector-ref temp-map curr-idx)))
                           temp-map)]
                 ; Update map by removing leftmost character if window is too large
                 [final-map (if (>= i (string-length p))
                               (let ([left-char (string-ref s j)]
                                    [temp-map (vector-copy new-map)])
                                 (vector-set! temp-map 
                                            (- (char->integer left-char) (char->integer #\a))
                                            (add1 (vector-ref temp-map 
                                                            (- (char->integer left-char) 
                                                               (char->integer #\a)))))
                                 temp-map)
                               new-map)]
                 [next-j (if (>= i (string-length p)) (add1 j) j)])
            
            (loop (add1 i)
                  next-j
                  final-map
                  (if (and (>= i (sub1 (string-length p)))
                          (is-anagram? final-map))
                      (cons next-j result)
                      result)))))))
