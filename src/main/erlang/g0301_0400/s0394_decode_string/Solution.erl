% #Medium #Top_100_Liked_Questions #String #Stack #Recursion #Level_1_Day_14_Stack #Udemy_Strings
% #Big_O_Time_O(n)_Space_O(n) #2025_01_20_Time_0_ms_(100.00%)_Space_58.58_MB_(100.00%)

-spec decode_string(S :: unicode:unicode_binary()) -> unicode:unicode_binary().
decode_string(S) ->
    decode_helper(S, 1).

decode_helper(S, I) when I > byte_size(S) ->
    <<>>;
decode_helper(S, I) ->
    decode_helper(S, I, 0, <<>>).

decode_helper(S, I, _Count, Acc) when I > byte_size(S) ->
    Acc;
decode_helper(S, I, Count, Acc) ->
    case binary:at(S, I-1) of
        C when C >= $a, C =< $z; C >= $A, C =< $Z ->
            decode_helper(S, I+1, Count, <<Acc/binary, C>>);
        C when C >= $0, C =< $9 ->
            NewCount = Count * 10 + (C - $0),
            decode_helper(S, I+1, NewCount, Acc);
        $[ ->
            {Repeated, NextI} = decode_bracket(S, I+1),
            RepeatedStr = repeat_string(Repeated, Count),
            decode_helper(S, NextI, 0, <<Acc/binary, RepeatedStr/binary>>);
        _ ->
            decode_helper(S, I+1, Count, Acc)
    end.

decode_bracket(S, I) ->
    decode_bracket(S, I, 0, <<>>).

decode_bracket(S, I, Count, Acc) when I > byte_size(S) ->
    {Acc, I};
decode_bracket(S, I, Count, Acc) ->
    case binary:at(S, I-1) of
        C when C >= $a, C =< $z; C >= $A, C =< $Z ->
            decode_bracket(S, I+1, Count, <<Acc/binary, C>>);
        C when C >= $0, C =< $9 ->
            NewCount = Count * 10 + (C - $0),
            decode_bracket(S, I+1, NewCount, Acc);
        $[ ->
            {Repeated, NextI} = decode_bracket(S, I+1),
            RepeatedStr = repeat_string(Repeated, Count),
            decode_bracket(S, NextI, 0, <<Acc/binary, RepeatedStr/binary>>);
        $] ->
            {Acc, I+1};
        _ ->
            decode_bracket(S, I+1, Count, Acc)
    end.

repeat_string(Str, Count) ->
    repeat_string(Str, Count, <<>>).

repeat_string(_, 0, Acc) ->
    Acc;
repeat_string(Str, Count, Acc) ->
    repeat_string(Str, Count-1, <<Acc/binary, Str/binary>>).
