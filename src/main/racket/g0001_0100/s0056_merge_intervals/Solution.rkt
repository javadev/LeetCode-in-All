; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting
; #Data_Structure_II_Day_2_Array #Level_2_Day_17_Interval #Udemy_2D_Arrays/Matrix
; #Top_Interview_150_Intervals #Big_O_Time_O(n_log_n)_Space_O(n)
; #2025_02_03_Time_474_(100.00%)_Space_131.06_(_%)

(define/contract (merge intervals)
  (-> (listof (listof exact-integer?)) (listof (listof exact-integer?)))
  (if (empty? intervals)
      '()
      (let* ([sorted-intervals (sort intervals (λ (a b) (< (first a) (first b))))])
        (let merge-helper ([intervals (rest sorted-intervals)]
                          [result (list (first sorted-intervals))])
          (cond
            [(empty? intervals) result]
            [else
             (let* ([current (last result)]
                    [next (first intervals)]
                    [current-end (second current)]
                    [next-start (first next)]
                    [next-end (second next)])
               (if (<= next-start current-end)
                   ; Merge overlapping intervals
                   (merge-helper 
                    (rest intervals)
                    (append (drop-right result 1)
                           (list (list (first current) 
                                     (max current-end next-end)))))
                   ; Add non-overlapping interval
                   (merge-helper 
                    (rest intervals)
                    (append result (list next)))))])))))
