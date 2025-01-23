% #Medium #Top_100_Liked_Questions #String #Hash_Table #Sliding_Window
% #Algorithm_II_Day_5_Sliding_Window #Programming_Skills_II_Day_12
% #Level_1_Day_12_Sliding_Window/Two_Pointer #Big_O_Time_O(n+m)_Space_O(1)
% #2025_01_22_Time_43_(100.00%)_Space_63.56_(100.00%)

-spec find_anagrams(S :: unicode:unicode_binary(), P :: unicode:unicode_binary()) -> [integer()].
find_anagrams(S, P) ->
    PLen = byte_size(P),
    SLen = byte_size(S),
    case PLen =< SLen of
        true ->
            Map = init_freq_map(P),
            Window = init_freq_map(binary_part(S, 0, PLen)),
            check_windows(S, PLen, Map, Window, 0, []);
        false ->
            []
    end.

init_freq_map(Bin) ->
    lists:foldl(
        fun(C, Acc) ->
            maps:put(C - $a, maps:get(C - $a, Acc, 0) + 1, Acc)
        end,
        maps:new(),
        binary_to_list(Bin)
    ).

check_windows(S, PLen, Map, Window, I, Result) when I =< byte_size(S) - PLen ->
    NewResult = case maps:to_list(Window) =:= maps:to_list(Map) of
        true -> [I | Result];
        false -> Result
    end,
    case I + PLen of
        SLen when SLen >= byte_size(S) ->
            lists:reverse(NewResult);
        Next ->
            RemoveChar = binary:at(S, I) - $a,
            AddChar = binary:at(S, Next) - $a,
            NewWindow1 = case maps:get(RemoveChar, Window) of
                1 -> maps:remove(RemoveChar, Window);
                N -> maps:put(RemoveChar, N - 1, Window)
            end,
            NewWindow2 = maps:put(AddChar, maps:get(AddChar, NewWindow1, 0) + 1, NewWindow1),
            check_windows(S, PLen, Map, NewWindow2, I + 1, NewResult)
    end;
check_windows(_, _, _, _, _, Result) ->
    lists:reverse(Result).
