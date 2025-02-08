; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Hash_Table #Design #Linked_List
; #Doubly_Linked_List #Udemy_Linked_List #Top_Interview_150_Linked_List
; #Big_O_Time_O(1)_Space_O(capacity) #2025_02_06_Time_471_(100.00%)_Space_163.64_(100.00%)

(define lru-cache%
  (class object%
    (super-new)
    
    (init-field capacity)
    
    (define head #f)
    (define tail #f)
    (define cache (make-hash))
    
    (define/private (move-to-head node)
      (when (not (eq? node head))
        (when (eq? node tail)
          (set! tail (hash-ref node 'prev))
          (when tail (hash-set! tail 'next #f)))
        (let ((prev (hash-ref node 'prev #f))
              (next (hash-ref node 'next #f)))
          (when prev (hash-set! prev 'next next))
          (when next (hash-set! next 'prev prev))
          (hash-set! node 'prev #f)
          (hash-set! node 'next head)
          (when head (hash-set! head 'prev node))
          (set! head node))))
    
    (define/public (get key)
      (let ((node (hash-ref cache key #f)))
        (if node
            (begin (move-to-head node)
                   (hash-ref node 'value))
            -1)))
    
    (define/public (put key value)
      (let ((node (hash-ref cache key #f)))
        (if node
            (begin
              (hash-set! node 'value value)
              (move-to-head node))
            (begin
              (when (>= (hash-count cache) capacity)
                (when tail
                  (hash-remove! cache (hash-ref tail 'key))
                  (set! tail (hash-ref tail 'prev #f))
                  (when tail (hash-set! tail 'next #f))))
              (let ((new-node (make-hash)))
                (hash-set! new-node 'key key)
                (hash-set! new-node 'value value)
                (hash-set! new-node 'prev #f)
                (hash-set! new-node 'next head)
                (when head (hash-set! head 'prev new-node))
                (set! head new-node)
                (unless tail (set! tail new-node))
                (hash-set! cache key new-node))))))))
