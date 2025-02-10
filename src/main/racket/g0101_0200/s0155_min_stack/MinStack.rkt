; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Stack #Design
; #Data_Structure_II_Day_14_Stack_Queue #Programming_Skills_II_Day_18 #Level_2_Day_16_Design
; #Udemy_Design #Top_Interview_150_Stack #Big_O_Time_O(1)_Space_O(N)
; #2025_02_08_Time_32_ms_(100.00%)_Space_130.81_MB_(100.00%)

(define min-stack%
  (class object%
    (super-new)
    
    (define vals '())
    
    ; push : exact-integer? -> void?
    (define/public (push val)
        (let* ([cur-min (if (empty? vals) val (get-min))]
               [new-top (cons val (min cur-min val))])
            (set! vals (cons new-top vals))))

    ; pop : -> void?
    (define/public (pop)
      (define res (top))
      (set! vals (cdr vals))
      res)

    ; top : -> exact-integer?
    (define/public (top)
      (car (first vals)))

    ; get-min : -> exact-integer?
    (define/public (get-min)
      (cdr (first vals)))))

;; Your min-stack% object will be instantiated and called as such:
;; (define obj (new min-stack%))
;; (send obj push val)
;; (send obj pop)
;; (define param_3 (send obj top))
;; (define param_4 (send obj get-min))
