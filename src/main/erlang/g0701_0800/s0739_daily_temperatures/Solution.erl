% #Medium #Top_100_Liked_Questions #Array #Stack #Monotonic_Stack #Programming_Skills_II_Day_6
% #Big_O_Time_O(n)_Space_O(n) #2025_01_12_Time_94_ms_(100.00%)_Space_125.36_MB_(100.00%)

-spec daily_temperatures([integer()]) -> [integer()].
daily_temperatures(Temp) ->
    {Result, _} = lists:mapfoldl(fun do_map_reduce/2, [], lists:zip(lists:reverse(Temp), lists:seq(0, length(Temp) - 1))),
    lists:reverse(Result).

do_map_reduce({X, I}, [{Y, J} | Tail]) when X >= Y ->
    do_map_reduce({X, I}, Tail);
do_map_reduce({X, I}, [{Y, J} | Tail]) ->
    {I - J, [{X, I}, {Y, J} | Tail]};
do_map_reduce({X, I}, []) ->
    {0, [{X, I}]}.
