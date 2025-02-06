; #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Matrix
; #Dynamic_Programming_I_Day_16 #Udemy_Dynamic_Programming #Top_Interview_150_Multidimensional_DP
; #Big_O_Time_O(m*n)_Space_O(m*n) #2025_02_04_Time_92_(100.00%)_Space_133.91_(100.00%)

; dynamic programming helper function
(define (mpsAux grid curpos dpTable ub)
	(local
		[(define (get grid pos) (list-ref (list-ref grid (car pos)) (cdr pos)))]
		(cond
			; return start value
			[(equal? curpos (cons 0 0)) (car (car grid))]

			; handle out of bounds
			[(or (< (car curpos) 0) (< (cdr curpos) 0)) +inf.0]

			; position appeared before
			[(hash-ref dpTable curpos #f) (hash-ref dpTable curpos)]

			; inductive case
			[else
				(let*
					(
						; go up
						[u_val (mpsAux grid (cons (- (car curpos) 1) (cdr curpos)) dpTable ub)]

						; go left 
						[l_val (mpsAux grid (cons (car curpos) (- (cdr curpos) 1)) dpTable ub)]

						; compute the current least cost
						[cur-least-cost (+ (get grid curpos) (min u_val l_val))]
					)
					(hash-set! dpTable curpos cur-least-cost)
					cur-least-cost
				)
			]
		)
	)
)

; the (x . y) position of the grid is the x'th row and y'th column of the grid
(define/contract (min-path-sum grid)
	(-> (listof (listof exact-integer?)) exact-integer?)
	(local
		[(define dpTable (make-hash))]
		(let*
			(
				[curpos (cons (- (length grid) 1) (- (length (car grid)) 1))]
				[least-val (mpsAux grid curpos dpTable 200)]
			)
			(inexact->exact least-val)
		)
	)
)
