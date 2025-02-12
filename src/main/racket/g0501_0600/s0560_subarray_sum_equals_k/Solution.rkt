; #Medium #Top_100_Liked_Questions #Array #Hash_Table #Prefix_Sum #Data_Structure_II_Day_5_Array
; #Big_O_Time_O(n)_Space_O(n) #2025_02_11_Time_56_ms_(100.00%)_Space_131.71_MB_(_%)

(define/contract (subarray-sum nums k)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (let ([temp-sum 0]
        [result 0]
        [sum-count (make-hash)])
    
    ; Initialize the hash with 0 sum occurring once
    (hash-set! sum-count 0 1)
    
    ; Process each number
    (for ([num nums])
      ; Update running sum
      (set! temp-sum (+ temp-sum num))
      
      ; Check if we have seen temp-sum - k before
      (when (hash-has-key? sum-count (- temp-sum k))
        (set! result (+ result (hash-ref sum-count (- temp-sum k)))))
      
      ; Update the count for current sum
      (hash-set! sum-count 
                 temp-sum 
                 (add1 (hash-ref sum-count temp-sum 0))))
    
    result))
