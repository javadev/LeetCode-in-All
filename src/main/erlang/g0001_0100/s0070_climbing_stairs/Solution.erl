% #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Math #Memoization
% #Algorithm_I_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_2
% #Level_1_Day_10_Dynamic_Programming #Udemy_Dynamic_Programming #Top_Interview_150_1D_DP
% #Big_O_Time_O(n)_Space_O(n) #2025_01_13_Time_0_(100.00%)_Space_58.51_(100.00%)

-spec climb_stairs(N :: integer()) -> integer().
climb_stairs(N) ->
    StairsRecursive = fun StairsRecursive(Res, Last, Curr) -> 
        if Curr == N ->
                Res;
            true ->
                StairsRecursive(Res + Last, Res, Curr + 1)
        end
    end,
    if N =< 2 ->
            N;
        true ->
            StairsRecursive(2,1,2)
    end.
