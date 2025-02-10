% #Easy #Dynamic_Programming #Bit_Manipulation #Udemy_Bit_Manipulation
% #Big_O_Time_O(num)_Space_O(num) #2025_01_20_Time_38_ms_(100.00%)_Space_77.22_MB_(100.00%)

-spec count_bits(N :: integer()) -> [integer()].
count_bits(N) ->
    InitMap = maps:from_list([{X, 0} || X <- lists:seq(0, N div 2)]),
    lists:reverse(do_count_bits(1, N, InitMap, [0])).

do_count_bits(I, N, _Map, Acc) when I > N ->
    Acc;
do_count_bits(I, N, Map, Acc) ->
    IBits = maps:get(I div 2, Map) + (I rem 2),
    NewMap = case I > (N div 2) of
        true -> Map;
        false -> maps:put(I, IBits, Map)
    end,
    do_count_bits(I + 1, N, NewMap, [IBits | Acc]).
