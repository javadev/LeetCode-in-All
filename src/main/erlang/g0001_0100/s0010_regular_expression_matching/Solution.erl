% #Hard #Top_Interview_Questions #String #Dynamic_Programming #Recursion #Udemy_Dynamic_Programming
% #Big_O_Time_O(m*n)_Space_O(m*n) #2025_01_09_Time_2019_(100.00%)_Space_58.37_(100.00%)

-spec is_match(S :: unicode:unicode_binary(), P :: unicode:unicode_binary()) -> boolean().
is_match(S, P) ->
    match(S, compile(P)).

compile(PatternStr) ->
    compile(PatternStr, []).

compile(<<>>, Acc) ->
    lists:reverse(Acc);
compile(<<Char, $*, Rest/binary>>, Acc) ->
    compile(Rest, [{star, Char}|Acc]);
compile(<<Char, Rest/binary>>, Acc) ->
    compile(Rest, [{single, Char}|Acc]).


match(<<>>, [])  -> true;
match(_,    [])  -> false;
match(<<>>, Pattern)  ->
    lists:all(fun F(E) -> {Type,_}=E, Type==star end, Pattern);
match(Text, Pattern) ->
    <<Char, Rest/binary>> = Text,
    [{MatchType, MatchChar}|PatternRest] = Pattern,
    case {MatchType, (Char==MatchChar) or (MatchChar==$.)} of
        {single, true } -> match(Rest, PatternRest);
        {single, false} -> false;
        {star,   true } -> case (match(Rest, Pattern)) of
                               true  -> true;
                               false -> match(Text, PatternRest)
                           end;
        {star,   false} -> match(Text, PatternRest)
    end.
