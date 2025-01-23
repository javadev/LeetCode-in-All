% #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Level_2_Day_13_Dynamic_Programming
% #Big_O_Time_O(n*sums)_Space_O(n*sums) #2025_01_22_Time_585_(100.00%)_Space_63.47_(100.00%)

-spec can_partition(Nums :: [integer()]) -> boolean().
can_partition(Nums) ->
    Sum = lists:sum(Nums),
    case Sum rem 2 of
        0 ->
            Target = Sum div 2,
            Dp = lists:foldl(
                fun(Num, Acc) ->
                    maps:fold(
                        fun(Sum0, true, InnerAcc) ->
                            case Sum0 + Num =< Target of
                                true -> InnerAcc#{Sum0 + Num => true};
                                false -> InnerAcc
                            end;
                        (_, false, InnerAcc) -> InnerAcc
                        end,
                        Acc#{Num => true},
                        Acc)
                end,
                #{0 => true},
                Nums),
            maps:get(Target, Dp, false);
        _ ->
            false
    end.
