; #Medium #Top_100_Liked_Questions #Array #Hash_Table #Sorting #Heap_Priority_Queue #Counting
; #Divide_and_Conquer #Quickselect #Bucket_Sort #Data_Structure_II_Day_20_Heap_Priority_Queue
; #Big_O_Time_O(n*log(n))_Space_O(k) #2025_02_11_Time_3_ms_(100.00%)_Space_103.26_MB_(100.00%)

(define (hash-table-counter ls)
  (let ([counts (make-hash)])
    (for-each (λ (v) (hash-update! counts v add1 0)) ls)
    counts))

(define (top-k-frequent nums k)
  (let ([counter (hash-table-counter nums)])
    (map car (take (sort (hash->list counter) #:key cdr >) k))))
