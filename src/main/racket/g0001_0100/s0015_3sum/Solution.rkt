; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Two_Pointers
; #Data_Structure_II_Day_1_Array #Algorithm_II_Day_3_Two_Pointers #Udemy_Two_Pointers
; #Top_Interview_150_Two_Pointers #Big_O_Time_O(n*log(n))_Space_O(n^2)
; #2025_02_03_Time_999_(100.00%)_Space_130.90_(100.00%)

(define (bin-search val left right items)
  (cond [(> left right) #f]
        [(= left right) (eq? val (vector-ref items left))]
        [else (let* ([left-val (vector-ref items left)]
                    [right-val (vector-ref items right)]
                    [mid (floor (/ (+ left right) 2))]
                    [mid-val (vector-ref items mid)])
                (cond
                  [(eq? mid-val val) #t]
                  [(eq? right-val val) #t]
                  [(eq? left-val val) #t]
                  [(< right-val val) #f]
                  [(> left-val val) #f]
                  [(> mid-val val) (bin-search val left (sub1 mid) items)]
                  [else (bin-search val (add1 mid) right items)]))]))
       

(define (next-left val left items)
  (if (>= left (vector-length items)) left
      (if (eq? val (vector-ref items left))
          (next-left val (add1 left) items)
          left)))

(define (two-sum val1 left items)
  (cond [(eq? (vector-length items) 0) '()]
        [(>= left (vector-length items)) '()]
        [else (let* ([val2 (vector-ref items left)]
         [val3 (- (+ val1 val2))]
         [val3found? (bin-search val3 (add1 left) (sub1 (vector-length items)) items)])
    (append (if val3found?
                (list (list val1 val2 val3))
                '())
            (two-sum val1 (next-left val2 (add1 left) items) items)))]))
            

(define (three-sum nums)
  (let* ([items (list->vector (sort nums <))]
        [len (vector-length items)])
    (let three ([left 0]
                [val1 (vector-ref items 0)])
      (cond
        [(eq? (- len left) 3) (let ([val1 (vector-ref items left)]
                                    [val2 (vector-ref items (add1 left))]
                                    [val3 (vector-ref items (+ left 2))])
                                (if (eq? (+ val1 val2 val3) 0) (list (list val1 val2 val3)) '()))]
        [(>= left (sub1 len)) '()]
        [else (let* ([new-left (next-left val1 left items)])
                (append (two-sum val1 (add1 left) items) (if (< new-left len) (three new-left (vector-ref items new-left)) '())))]))))
