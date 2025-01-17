% #Medium #Array #Bit_Manipulation #2025_01_16_Time_6_(100.00%)_Space_70.55_(100.00%)

-spec single_number(Nums :: [integer()]) -> integer().
single_number(Nums) ->
    Frequencies = lists:foldl(fun count_frequency/2, #{}, Nums),
    {Key, _} = lists:keyfind(1, 2, maps:to_list(Frequencies)),
    Key.

-spec count_frequency(Num :: integer(), Map :: map()) -> map().
count_frequency(Num, Map) ->
    maps:update_with(Num, fun(V) -> V + 1 end, 1, Map).
