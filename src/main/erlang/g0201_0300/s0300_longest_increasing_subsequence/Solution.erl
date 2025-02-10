% #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Binary_Search
% #Algorithm_II_Day_16_Dynamic_Programming #Binary_Search_II_Day_3 #Dynamic_Programming_I_Day_18
% #Udemy_Dynamic_Programming #Top_Interview_150_1D_DP #Big_O_Time_O(n*log_n)_Space_O(n)
% #2025_01_20_Time_954_ms_(100.00%)_Space_64.54_MB_(100.00%)

-spec length_of_lis(Nums :: [integer()]) -> integer().
length_of_lis(Nums) ->
    Pred = fun(V, Index) -> { {Index, V}, Index + 1} end,
    {IVals, _} = lists:mapfoldl(Pred, 0, Nums),
    [H|T] = IVals,
    Tid = ets:new(lis, []),
    length_of_lis([], T, H, Tid, 0).

length_of_lis(Before, [], {_, Val}, Tid, Max) ->
    max(lis(Before, Val, Tid) + 1, Max);
length_of_lis(Before, [Next|After], Current={Index, Val}, Tid, Max) ->
    Lis = lis(Before, Val, Tid) + 1,
    ets:insert(Tid, {Index, Lis}),
    length_of_lis([Current|Before], After, Next, Tid, max(Max, Lis)).

lis([], _, _) -> 0;
lis(L, N, Tid) ->
    Opts = lists:filter(fun({I, V}) -> V < N end, L),
    Pred = fun({I, _}) -> ets:lookup_element(Tid, I, 2) end,
    case Opts of
        [] -> 0;
        _ ->
            lists:max(lists:map(Pred, Opts))
    end.
