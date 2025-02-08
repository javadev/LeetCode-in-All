; #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Sorting #Counting
; #Divide_and_Conquer #Data_Structure_II_Day_1_Array #Udemy_Famous_Algorithm
; #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(1)
; #2025_02_08_Time_0_(100.00%)_Space_131.10_(80.00%)

(define/contract (majority-element nums)
  (-> (listof exact-integer?) exact-integer?)
  (define candidate 0)
  (define count 0)

  (for ([n nums])
    (cond
        [(zero? count)
            (set! candidate n)
            (set! count 1)
        ]
        [(= candidate n)
            (set! count (+ count 1))
        ]
        [else
            (set! count(- count 1))
        ]
    )
  )
  candidate
)
