; #Hard #Top_100_Liked_Questions #Array #Backtracking #Big_O_Time_O(N!)_Space_O(N)
; #2025_02_03_Time_123_(100.00%)_Space_129.70_(100.00%)

(define (reverse sequence)
    (foldr (lambda (x y) (append y (list x))) `() sequence))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
    (if (> low high)
        `()
        (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
    (accumulate append `() (map proc seq)))

(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap
                    (lambda (rest-of-queens)
                        (map (lambda (new-row)
                            (adjoin-position new-row k rest-of-queens))
                        (enumerate-interval 1 board-size)))
                    (queen-cols (- k 1))))))
    (queen-cols board-size))

(define (adjoin-position new-row k rest-of-queens)
    (append rest-of-queens (list (cons new-row k))))

(define empty-board `())

(define (all proc items)
    (define (iter items)
        (cond ((null? items) #t)
            ((proc (car items)) (iter (cdr items))) 
            (else #f)))
    (iter items))

; None in row, and none in either diagonal
(define (safe? k positions)
    (define (safe-combo? a b)
        (not (or (= (car a) (car b))
                (= (abs (- (car a) (car b)))
                    (abs (- (cdr a) (cdr b)))))))
    (all (lambda (p) (safe-combo? (car (reverse positions)) p)) (cdr (reverse positions))))

; board building to bridge solution to LC format
(define (cdr-by-car lst)
  (map cdr (sort lst >= #:key car)))

(define (solution-to-board n soln)
  (map (lambda (row) (make-row row n)) (cdr-by-car soln)))

(define (make-row k n)
  (string-join (list (k-dots (- k 1)) "Q" (k-dots (- n k))) ""))

(define (k-dots k)
  (string-join (make-list k ".") ""))

(define/contract (solve-n-queens n)
  (-> exact-integer? (listof (listof string?)))
    (map (lambda (soln) (solution-to-board n soln)) (queens n))
  )
