% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
% #Algorithm_I_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_3
% #Level_2_Day_12_Dynamic_Programming #Udemy_Dynamic_Programming #Top_Interview_150_1D_DP
% #Big_O_Time_O(n)_Space_O(n) #2025_01_18_Time_0_ms_(100.00%)_Space_58.88_MB_(100.00%)

-spec rob(Nums :: [integer()]) -> integer().
rob(Nums) ->
    Results = lists:foldr(
        fun(E, Results) ->
            Result = max(nth(2, Results), nth(3, Results)),
            [Result + E| Results]
        end,
        [],
        Nums
    ),
    max(nth(1, Results), nth(2, Results)).

nth(Pos, Results) ->
    case length(Results) of
        N when N < Pos ->
            0;
        _ ->
            lists:nth(Pos, Results)
    end.
