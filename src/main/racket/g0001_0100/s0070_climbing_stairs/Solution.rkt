; #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Math #Memoization
; #Algorithm_I_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_2
; #Level_1_Day_10_Dynamic_Programming #Udemy_Dynamic_Programming #Top_Interview_150_1D_DP
; #Big_O_Time_O(n)_Space_O(n) #2025_02_04_Time_0_(100.00%)_Space_101.51_(100.00%)

(define (clmHelp n hTable)
	(cond
		; base cases
		((= 1 n) 1)
		((= 2 n) 2)
		((hash-ref hTable n #f) (hash-ref hTable n))

		; inductive case
		(else
			(let*
				; the local variables
				(
					(a (clmHelp (- n 1) hTable))
					(b (clmHelp (- n 2) hTable))
					(numPos (+ a b))
				)

				; the body
				(hash-set! hTable n numPos)
				numPos
			)
		)
	)
)

(define/contract (climb-stairs n)
	(-> exact-integer? exact-integer?)
	(local
		; local definitions
		((define hTable (make-hash)))

		; function body
		(clmHelp n hTable)
	)
)
