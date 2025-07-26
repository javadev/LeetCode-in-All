; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Heap_Priority_Queue
; #Divide_and_Conquer #Quickselect #LeetCode_75_Heap/Priority_Queue
; #Data_Structure_II_Day_20_Heap_Priority_Queue #Top_Interview_150_Heap
; #Big_O_Time_O(n*log(n))_Space_O(log(n))
; #2025_02_10_Time_79_ms_(100.00%)_Space_135.10_MB_(100.00%)

(define/contract (find-kth-largest nums k)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (let* ([sorted-nums (sort nums >)]  ; Sort in descending order
         [index (- k 1)])             ; Convert 1-based to 0-based index
    (list-ref sorted-nums index)))    ; Return the k-th largest element
