% #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search #Divide_and_Conquer
% #Top_Interview_150_Binary_Search #Big_O_Time_O(log(min(N,M)))_Space_O(1)
% #AI_can_be_used_to_solve_the_task #2025_01_08_Time_1_ms_(100.00%)_Space_65.96_MB_(100.00%)

-spec find_median_sorted_arrays(Nums1 :: [integer()], Nums2 :: [integer()]) -> float().
find_median_sorted_arrays(Nums1, Nums2) -> 
    Len = length(Nums1) + length(Nums2),
    find_median_sorted_arrays(Nums1, Nums2, [], -1, 0, 0, Len rem 2, Len div 2).
find_median_sorted_arrays(_, _, [H|T], Index, _, _, Even, Index) ->
        if Even =:= 1 -> H;
            true -> (H + lists:nth(1, T)) / 2
        end;
find_median_sorted_arrays([], [H2|T2], MyArr, Index, Indx1, Indx2, Even, Middle) ->
    find_median_sorted_arrays([], T2, [H2|MyArr], Index + 1, Indx1, Indx2 + 1, Even, Middle);
find_median_sorted_arrays([H1|T1], [], MyArr, Index, Indx1, Indx2, Even, Middle) ->
    find_median_sorted_arrays(T1, [], [H1|MyArr], Index + 1, Indx1, Indx2 + 1, Even, Middle);
find_median_sorted_arrays([H1|T1], [H2|T2], MyArr, Index, Indx1, Indx2, Even, Middle) when H1 < H2 -> 
    find_median_sorted_arrays(T1, [H2|T2], [H1|MyArr], Index + 1, Indx1 + 1, Indx2, Even, Middle);
find_median_sorted_arrays([H1|T1], [H2|T2], MyArr, Index, Indx1, Indx2, Even, Middle)-> 
    find_median_sorted_arrays([H1|T1], T2, [H2|MyArr], Index + 1, Indx1, Indx2 + 1, Even, Middle).
