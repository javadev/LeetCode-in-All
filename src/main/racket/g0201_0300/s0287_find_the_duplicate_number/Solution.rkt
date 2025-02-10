; #Medium #Top_100_Liked_Questions #Array #Binary_Search #Two_Pointers #Bit_Manipulation
; #Binary_Search_II_Day_5 #Big_O_Time_O(n)_Space_O(n)
; #2025_02_10_Time_327_ms_(100.00%)_Space_132.76_MB_(100.00%)

(require racket/hash)

(define/contract (find-duplicate nums)
  (-> (listof exact-integer?) exact-integer?)
  (letrec
      ([find-recurse
           (lambda (ns seen)
             (cond [(null? ns) -1]
                   [(hash-has-key? seen (car ns)) (car ns)]
                   [else (find-recurse
                           (cdr ns)
                           (hash-union
                             seen
                             (make-immutable-hash (list (cons (car ns) #t)))))]))])
    (find-recurse nums (make-immutable-hash))))
