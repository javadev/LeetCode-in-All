% #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Greedy
% #Algorithm_II_Day_13_Dynamic_Programming #Dynamic_Programming_I_Day_4
% #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(1)
% #2025_01_12_Time_488_ms_(100.00%)_Space_66.60_MB_(100.00%)

-spec jump(Nums :: [integer()]) -> integer().
jump(Nums) ->
    jump(Nums, 0, 0, 0).

% Main jump function that counts the number of jumps
-spec jump(Nums :: [integer()], L :: integer(), R :: integer(), Jumps :: integer()) -> integer().
jump(Nums, L, R, Jumps) when R < length(Nums) - 1 ->
    Prev = R,
    NewR = get_max(Nums, L, R),
    jump(Nums, Prev + 1, NewR, Jumps + 1);
jump(_, _, _, Jumps) -> 
    Jumps.

% Helper function to get the maximum reachable index within a range
-spec get_max(Nums :: [integer()], L :: integer(), R :: integer()) -> integer().
get_max(Nums, L, R) ->
    get_max(Nums, L, R, -1).

% Recursive get_max to calculate the max reachable index
get_max(Nums, L, R, Max) when L =< R ->
    Curr = L + lists:nth(L + 1, Nums),
    NewMax = max(Curr, Max),
    get_max(Nums, L + 1, R, NewMax);
get_max(_, _, _, Max) -> Max.
