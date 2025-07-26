; #Medium #Top_100_Liked_Questions #Array #Prefix_Sum #LeetCode_75_Array/String
; #Data_Structure_II_Day_5_Array #Udemy_Arrays #Top_Interview_150_Array/String
; #Big_O_Time_O(n^2)_Space_O(n) #2025_02_10_Time_10_ms_(100.00%)_Space_132.25_MB_(100.00%)

(define/contract (product-except-self nums)
  (-> (listof exact-integer?) (listof exact-integer?))
  (let* ((first-pass (foldl mult-w-track-zero '(1 0) nums))
	 (prod (car first-pass))
	 (zero-count (second first-pass)))
    (map (lambda (x)
	   (cond
	    [(zero? zero-count)
	     (/ prod x)]
	    [(= 1 zero-count)
	     (if (zero? x) prod 0)]
	    [else 0])) nums)))

(define (mult-w-track-zero x acc)
  (let* ((prod (car acc))
	(zero-count (second acc))
	(new-count (if (zero? x) (add1 zero-count) zero-count)))
    (list (if (= 0 x) prod (* prod x))
	  new-count)))
