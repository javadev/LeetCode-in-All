; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
; #Divide_and_Conquer #Data_Structure_I_Day_1_Array #Dynamic_Programming_I_Day_5
; #Udemy_Famous_Algorithm #Top_Interview_150_Kadane's_Algorithm #Big_O_Time_O(n)_Space_O(1)
; #2025_02_03_Time_51_(100.00%)_Space_140.95_(100.00%)

(define/contract (recur nums)
    (-> (listof exact-integer?) pair?)
    (if (empty? nums) (cons 0 -1000000)
    (let* ([i (first nums)]
           [res (recur (cdr nums))]
           [currBest (car res)]
           [bestSofar (cdr res)]
           [currNew (max i (+ currBest i))]
           )
        (cons currNew (max bestSofar currNew)))))

(define/contract (max-sub-array nums)
  (-> (listof exact-integer?) exact-integer?)
  (cdr (recur nums)))
