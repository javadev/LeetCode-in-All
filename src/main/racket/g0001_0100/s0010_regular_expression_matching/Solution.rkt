; #Hard #Top_Interview_Questions #String #Dynamic_Programming #Recursion #Udemy_Dynamic_Programming
; #Big_O_Time_O(m*n)_Space_O(m*n) #2025_02_03_Time_11_(100.00%)_Space_101.36_(100.00%)

(define (regex-state s is-star)
  (list s (if is-star '* '1)))

(define (regex-state-string ps)
  (car ps))

(define (regex-state-star? ps)
  (eq? (cadr ps) '*))

(define (regex-state-single-char? ps)
  (eq? (cadr ps) '1))

(define (parse-regex regex)
  (cond [(eq? (string-length regex) 0) '()]
        [(eq? (string-length regex) 1) (list (regex-state regex #f))]
        [(eq? (string-ref regex 1) #\*)
            (cons (regex-state (substring regex 0 1) #t) (parse-regex (substring regex 2)))]
        [else
         (cons (regex-state (substring regex 0 1) #f) (parse-regex (substring regex 1)))]))

; Collapse repeated star statements. "a*a*" is the same as "a*"
(define (optimized-parsed-regex parsed-regex)
  (cond ([empty? parsed-regex] '())
        ([= (length parsed-regex) 1] parsed-regex)
        ([and
          (regex-state-star? (car parsed-regex))
          (regex-state-star? (cadr parsed-regex))
          (string=? (regex-state-string (car parsed-regex))
                    (regex-state-string (cadr parsed-regex)))]                
         (cons (car parsed-regex) (optimized-parsed-regex (cddr parsed-regex))))
        (else
         (cons (car parsed-regex) (optimized-parsed-regex (cdr parsed-regex))))))
(define (match-regex-part s p)
  (cond ([empty? p] #f)
        ([= (string-length s) 0] (regex-state-star? p))
        ([= (string-length s) 1]
         (or (string=? "." (car p)) (string=? s (regex-state-string p))))
        (else #f)))

(define (first-part-of-string s)
  (if (= (string-length s) 0) "" (substring s 0 1)))
(define (reduce-string s)
  (if (= (string-length s) 0) "" (substring s 1)))

(define (is-match-regex-parsed s parsed-exp)
  (cond ([= (string-length s) 0]
         (or
          (= (length parsed-exp) 0)
          (andmap regex-state-star? parsed-exp)))
        ([= (length parsed-exp) 0] (= (string-length s) 0))
        ([regex-state-single-char? (car parsed-exp)]
         (if (match-regex-part (first-part-of-string s) (car parsed-exp))
             (is-match-regex-parsed (reduce-string s) (cdr parsed-exp))
             #f))             
        ([regex-state-star? (car parsed-exp)]
         (or
          (is-match-regex-parsed s (cdr parsed-exp))
          (if (match-regex-part (first-part-of-string s) (car parsed-exp))
              (is-match-regex-parsed (reduce-string s) parsed-exp)
              #f)))            
        (else 'error)))
        

(define/contract (is-match s p)
  (-> string? string? boolean?)
  (is-match-regex-parsed s (optimized-parsed-regex (parse-regex p))))
