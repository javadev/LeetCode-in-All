% #Medium #Top_100_Liked_Questions #String #Dynamic_Programming
% #Algorithm_II_Day_18_Dynamic_Programming #Dynamic_Programming_I_Day_19
% #Udemy_Dynamic_Programming #Top_Interview_150_Multidimensional_DP #Big_O_Time_O(n^2)_Space_O(n2)
% #2025_01_13_Time_251_ms_(100.00%)_Space_122.91_MB_(100.00%)

-spec min_distance(Word1 :: unicode:unicode_binary(), Word2 :: unicode:unicode_binary()) -> integer().
min_distance(Word1, Word2) ->
    Word1List = [" " | unicode:characters_to_list(Word1)],
    Word2List = [" " | unicode:characters_to_list(Word2)],
    Len1 = length(Word1List) - 1,
    Len2 = length(Word2List) - 1,
    
    Map = build_distance_map(Word1List, Word2List),
    maps:get({Len1, Len2}, Map).

build_distance_map(Word1List, Word2List) ->
    Indices1 = lists:zip(Word1List, lists:seq(0, length(Word1List) - 1)),
    Indices2 = lists:zip(Word2List, lists:seq(0, length(Word2List) - 1)),
    lists:foldl(
        fun({Ch1, I}, MapAcc1) ->
            lists:foldl(
                fun({Ch2, J}, MapAcc2) ->
                    Value = calculate_distance(Ch1, Ch2, I, J, MapAcc2),
                    maps:put({I, J}, Value, MapAcc2)
                end,
                MapAcc1,
                Indices2
            )
        end,
        maps:new(),
        Indices1
    ).

calculate_distance(_, _, 0, J, _) -> J;
calculate_distance(_, _, I, 0, _) -> I;
calculate_distance(Ch, Ch, I, J, Map) ->
    maps:get({I-1, J-1}, Map);
calculate_distance(_, _, I, J, Map) ->
    Min1 = min(maps:get({I-1, J}, Map), maps:get({I-1, J-1}, Map)),
    Min2 = min(Min1, maps:get({I, J-1}, Map)),
    Min2 + 1.
