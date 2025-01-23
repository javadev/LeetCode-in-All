% #Medium #Array #Dynamic_Programming #Backtracking #Big_O_Time_O(n*(sum+s))_Space_O(n*(sum+s))
% #2025_01_22_Time_377_(100.00%)_Space_60.11_(100.00%)

-spec find_target_sum_ways(Nums :: [integer()], Target :: integer()) -> integer().
find_target_sum_ways(Nums, Target) ->
    TotalSum = lists:sum(Nums),
    Sum = TotalSum - Target,
    case Sum < 0 orelse Sum rem 2 =:= 1 of
        true -> 0;
        false -> solve(Nums, Sum div 2)
    end.

-spec solve(Nums :: [integer()], Target :: integer()) -> integer().
solve([First|_] = Nums, Target) ->
    Prev = lists:duplicate(Target + 1, 0),
    InitPrev = case First of
        0 -> lists:sublist([2|lists:duplicate(Target, 0)], Target + 1);
        _ when First =< Target -> 
            lists:sublist([1] ++ lists:duplicate(First - 1, 0) ++ [1] ++ 
                         lists:duplicate(Target - First, 0), Target + 1);
        _ -> [1|lists:duplicate(Target, 0)]
    end,
    process_nums(tl(Nums), Target, InitPrev).

process_nums([], _Target, Prev) ->
    lists:last(Prev);
process_nums([Num|Rest], Target, Prev) ->
    Curr = lists:foldl(fun(J, Acc) ->
        Taken = case J >= Num of
            true -> lists:nth(J - Num + 1, Prev);
            false -> 0
        end,
        NonTaken = lists:nth(J + 1, Prev),
        Acc ++ [Taken + NonTaken]
    end, [], lists:seq(0, Target)),
    process_nums(Rest, Target, Curr).
