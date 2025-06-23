% #Medium #Top_100_Liked_Questions #String #Dynamic_Programming #LeetCode_75_DP/Multidimensional
% #Algorithm_II_Day_17_Dynamic_Programming #Dynamic_Programming_I_Day_19
% #Udemy_Dynamic_Programming #Big_O_Time_O(n*m)_Space_O(n*m)
% #2025_01_22_Time_2600_ms_(100.00%)_Space_412.75_MB_(100.00%)

-spec longest_common_subsequence(Text1 :: unicode:unicode_binary(), Text2 :: unicode:unicode_binary()) -> integer().
longest_common_subsequence(Text1, Text2) ->
    S1 = binary_to_list(Text1),
    S2 = binary_to_list(Text2),
    Key = {length(S1) - 1, length(S2) - 1},
    Memo = #{},
    maps:get(Key, recur(Memo, S1, S2, Key), 0).

-spec recur(map(), list(), list(), {integer(), integer()}) -> map().
recur(Memo, [], _, Key) ->
    maps:put(Key, 0, Memo);
recur(Memo, _, [], Key) ->
    maps:put(Key, 0, Memo);
recur(Memo, [X | Xs] = Xss, [Y | Ys] = Yss, {I, J} = Key) ->
    case maps:is_key(Key, Memo) of
        true ->
            Memo;
        false ->
            if
                X =:= Y ->
                    Memo1 = recur(Memo, Xs, Ys, {I - 1, J - 1}),
                    maps:put(Key, 1 + maps:get({I - 1, J - 1}, Memo1, 0), Memo1);
                true ->
                    Memo1 = recur(Memo, Xss, Ys, {I, J - 1}),
                    Memo2 = recur(Memo1, Xs, Yss, {I - 1, J}),
                    maps:put(Key, max(maps:get({I, J - 1}, Memo2, 0), maps:get({I - 1, J}, Memo2, 0)), Memo2)
            end
    end.
