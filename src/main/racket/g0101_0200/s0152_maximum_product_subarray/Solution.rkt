; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
; #Dynamic_Programming_I_Day_6 #Level_2_Day_13_Dynamic_Programming #Udemy_Dynamic_Programming
; #Big_O_Time_O(N)_Space_O(1) #2025_02_08_Time_731_(100.00%)_Space_102.15_(_%)

(define/contract (max-product nums)
  (-> (listof exact-integer?) exact-integer?)
  (let* ([n (length nums)]
         [min-int (- (expt 2 31))])
    (let loop ([i 0]
               [start 1]
               [end 1]
               [overall-max-prod min-int])
      (if (= i n)
          overall-max-prod
          (let* ([new-start (if (zero? start) 1 start)]
                 [new-end (if (zero? end) 1 end)]
                 [start-prod (* new-start (list-ref nums i))]
                 [end-prod (* new-end (list-ref nums (- n i 1)))])
            (loop (+ i 1)
                  start-prod
                  end-prod
                  (max overall-max-prod start-prod end-prod)))))))
