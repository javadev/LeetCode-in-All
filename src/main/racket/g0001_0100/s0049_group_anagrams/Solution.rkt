; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #String #Hash_Table #Sorting
; #Data_Structure_II_Day_8_String #Programming_Skills_II_Day_11 #Udemy_Strings
; #Top_Interview_150_Hashmap #Big_O_Time_O(n*k_log_k)_Space_O(n)
; #2025_02_03_Time_72_ms_(100.00%)_Space_131.77_MB_(100.00%)

(define (group-anagrams strs)
  (group-by (compose1 (curryr sort char<?) string->list) strs))
