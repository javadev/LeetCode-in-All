% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Backtracking
% #Algorithm_I_Day_11_Recursion_Backtracking #Level_2_Day_20_Brute_Force/Backtracking
% #Udemy_Backtracking/Recursion #Top_Interview_150_Backtracking #Big_O_Time_O(n*n!)_Space_O(n+n!)
% #2025_01_12_Time_0_(100.00%)_Space_59.22_(100.00%)

-spec permute(Nums :: [integer()]) -> [[integer()]].
permute([Num]) ->
    [[Num]];
permute(Nums) ->
    Permute = fun(Num) ->
        Rest = lists:delete(Num, Nums),
        lists:map(fun(Tail) -> [Num | Tail] end, permute(Rest))
    end,
    lists:append(lists:map(Permute, Nums)).
