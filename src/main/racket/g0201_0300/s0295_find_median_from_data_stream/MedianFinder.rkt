; #Hard #Top_100_Liked_Questions #Sorting #Two_Pointers #Design #Heap_Priority_Queue #Data_Stream
; #Top_Interview_150_Heap #Big_O_Time_O(n*log_n)_Space_O(n)
; #2025_02_15_Time_437_ms_(100.00%)_Space_132.32_MB_(100.00%)

(require data/heap racket/class)

(define median-finder%
  (class object%
    (super-new)
    
    ;; Max heap (stores smaller half, max at the top)
    (define max-heap (make-heap >))
    ;; Min heap (stores larger half, min at the top)
    (define min-heap (make-heap <))

    ;; add-num : exact-integer? -> void?
    (define/public (add-num num)
      (heap-add! max-heap num)                      ; Add to max-heap
      (heap-add! min-heap (heap-min max-heap))      ; Move max-heap root to min-heap
      (heap-remove-min! max-heap)                   ; Remove moved element

      ;; Balance: Ensure max-heap has at least as many elements as min-heap
      (when (> (heap-count min-heap) (heap-count max-heap))
        (heap-add! max-heap (heap-min min-heap))
        (heap-remove-min! min-heap)))

    ;; find-median : -> flonum?
    (define/public (find-median)
      (if (> (heap-count max-heap) (heap-count min-heap))
          (exact->inexact (heap-min max-heap))
          (/ (+ (heap-min max-heap) (heap-min min-heap)) 2.0)))))

;; Your median-finder% object will be instantiated and called as such:
;; (define obj (new median-finder%))
;; (send obj add-num num)
;; (define param_2 (send obj find-median))
