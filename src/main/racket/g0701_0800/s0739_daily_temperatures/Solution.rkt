; #Medium #Top_100_Liked_Questions #Array #Stack #Monotonic_Stack #LeetCode_75_Monotonic_Stack
; #Programming_Skills_II_Day_6 #Big_O_Time_O(n)_Space_O(n)
; #2025_02_12_Time_42_ms_(100.00%)_Space_132.69_MB_(100.00%)

(define/contract (daily-temperatures temp)
    (-> (listof exact-integer?) (listof exact-integer?))
    (let make-answer
        ([i 0] [temp-rev (reverse temp)] [higher null] [answer null])
        (match temp-rev
            [(cons t temp-rev) (let* (
                [higher
                    (let eliminate<=t ([higher higher]) (match higher
                        [(cons (cons t1 _) higher) #:when (>= t t1) (eliminate<=t higher)]
                        [_ higher]))]
                [a (if (null? higher) 0 (- i (cdar higher)))] )
                (make-answer (add1 i) temp-rev (cons (cons t i) higher) (cons a answer)))]
            [(list) answer])))
