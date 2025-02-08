; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table
; #Dynamic_Programming #Trie #Memoization #Algorithm_II_Day_15_Dynamic_Programming
; #Dynamic_Programming_I_Day_9 #Udemy_Dynamic_Programming #Top_Interview_150_1D_DP
; #Big_O_Time_O(M+max*N)_Space_O(M+N+max) #2025_02_06_Time_4_(100.00%)_Space_102.55_(100.00%)

(define/contract (word-break s wordDict)
  (-> string? (listof string?) boolean?)
  (let ((memo (make-hash)))
    (define (dp i)
      (cond
        [(= i (string-length s)) #t]
        [(hash-has-key? memo i) (hash-ref memo i)]
        [else
         (let loop ((words wordDict))
           (if (null? words)
               (begin (hash-set! memo i #f) #f)
               (let* ((word (car words))
                      (len (string-length word)))
                 (if (and (<= (+ i len) (string-length s))
                          (string=? (substring s i (+ i len)) word)
                          (dp (+ i len)))
                     (begin (hash-set! memo i #t) #t)
                     (loop (cdr words))))))]))
    (dp 0)))
