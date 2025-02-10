% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Bit_Manipulation #Backtracking
% #Algorithm_II_Day_9_Recursion_Backtracking #Udemy_Backtracking/Recursion
% #Big_O_Time_O(2^n)_Space_O(n*2^n) #2025_01_14_Time_0_ms_(100.00%)_Space_58.98_MB_(100.00%)

-spec subsets(Nums :: [integer()]) -> [[integer()]].

make(N, _, Tmp, Cnt) when Cnt =:= N -> [Tmp];
make(_, [], _, _) -> [];
make(N, [H | T], Tmp, Cnt) -> 
    make(N, T, Tmp ++ [H], Cnt + 1) ++
    make(N, T, Tmp, Cnt).

subsets(Nums) ->
    lists:foldl(
        fun(N, Ans) ->
            Ans ++ make(N, Nums, [], 0)
        end, [], lists:seq(0, length(Nums))
    ).
