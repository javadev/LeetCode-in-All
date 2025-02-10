% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Sliding_Window
% #Algorithm_I_Day_6_Sliding_Window #Level_2_Day_14_Sliding_Window/Two_Pointer #Udemy_Strings
% #Top_Interview_150_Sliding_Window #Big_O_Time_O(n)_Space_O(1) #AI_can_be_used_to_solve_the_task
% #2025_01_08_Time_11_ms_(100.00%)_Space_61.60_MB_(60.00%)

-spec length_of_longest_substring(S :: unicode:unicode_binary()) -> integer().
length_of_longest_substring(S) ->
    do(S, 0, #{}, 0, 1).

do(<<Char, Rest/binary>>, Index, PrevPos, Max, Acc0) when is_map_key(Char, PrevPos) ->
    PrevIndex = map_get(Char, PrevPos),
    Acc1 = Index - PrevIndex,
    Acc = min(Acc1, Acc0),
    do(Rest, Index + 1, PrevPos#{Char => Index}, max(Max, Acc), Acc + 1);
do(<<Char, Rest/binary>>, Index, PrevPos, Max, Acc) when Acc > Max ->
    do(Rest, Index + 1, PrevPos#{Char => Index}, Acc, Acc + 1);
do(<<Char, Rest/binary>>, Index, PrevPos, Max, Acc) ->
    do(Rest, Index + 1, PrevPos#{Char => Index}, Max, Acc + 1);

do(<<>>, _, _, Max, _) -> Max.
