% #Medium #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_II_Day_2_Binary_Search
% #Binary_Search_I_Day_12 #Udemy_Binary_Search #Top_Interview_150_Binary_Search
% #Big_O_Time_O(log_N)_Space_O(log_N) #2025_01_18_Time_0_ms_(100.00%)_Space_60.97_MB_(100.00%)

-spec find_min(Nums :: [integer()]) -> integer().
find_min([N]) ->
    N;
find_min(Nums) ->
    Count = length(Nums),
    Mid = Count div 2,
    Left = lists:sublist(Nums, Mid),
    Right = lists:nthtail(Mid, Nums),
    MinLeft = find_min(Left),
    MinRight = find_min(Right),
    erlang:min(MinLeft, MinRight).
