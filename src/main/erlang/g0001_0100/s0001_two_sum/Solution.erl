% #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table
% #Data_Structure_I_Day_2_Array #Level_1_Day_13_Hashmap #Udemy_Arrays #Top_Interview_150_Hashmap
% #Big_O_Time_O(n)_Space_O(n) #AI_can_be_used_to_solve_the_task
% #2025_01_05_Time_3_ms_(97.50%)_Space_65.32_MB_(7.50%)

-spec two_sum(Nums :: [integer()], Target :: integer()) -> [integer()].
two_sum(Nums, Target) ->
    two_sum(Nums, Target, #{}, 0).

two_sum([], _, _, _) -> undefined;
two_sum([H|T], Target, M, Index) ->
    case M of
        #{ Target-H := Pair } -> [Pair, Index];
        _ -> two_sum(T, Target, M#{ H => Index }, Index + 1)
    end.
