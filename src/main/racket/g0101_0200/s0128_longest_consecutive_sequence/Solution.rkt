; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Union_Find
; #Top_Interview_150_Hashmap #Big_O_Time_O(N_log_N)_Space_O(1)
; #2025_02_05_Time_182_(100.00%)_Space_144.85_(100.00%)

(define (longest-consecutive nums)
  (define uniq (list->set nums))

  (define (seq x a)
    (cond
      [(set-member? uniq x) (seq (add1 x) (add1 a))]
      [else a]))

  (let loop ([l (set->list uniq)] [m 0])
    (match l
      ['() m]
      [(cons x xs) #:when (not (set-member? uniq (sub1 x))) (loop xs (max m (seq x 0)))]
      [(cons x xs) (loop xs m)])))
