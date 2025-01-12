% #Medium #Top_Interview_Questions #String #2025_01_09_Time_0_(100.00%)_Space_58.90_(100.00%)

%% Define the function specification
-spec my_atoi(S :: binary()) -> integer().
my_atoi(S) ->
    %% Convert binary to list of characters for easier manipulation
    Chars = binary:bin_to_list(S),
    
    %% Skip leading whitespace
    CharsAfterWhitespace = skip_whitespace(Chars),
    
    %% Determine the sign
    {Sign, CharsAfterSign} = case CharsAfterWhitespace of
        [$+ | Rest] -> {1, Rest};
        [$- | Rest] -> {-1, Rest};
        _ -> {1, CharsAfterWhitespace}
    end,
    
    %% Convert the string to an integer
    {Result, CharsAfterNumber} = parse_number(CharsAfterSign, 0),
    
    %% Handle rounding
    FinalResult = case Result * Sign of
        X when X < -2147483648 -> -2147483648;
        X when X > 2147483647 -> 2147483647;
        X -> X
    end,
    
    FinalResult.

%% Helper function to skip leading whitespace
skip_whitespace([]) ->
    [];
skip_whitespace([32 | Rest]) ->
    skip_whitespace(Rest);
skip_whitespace(Chars) ->
    Chars.

%% Helper function to parse the number
parse_number([], Acc) ->
    {Acc, []};
parse_number([H | T], Acc) when H >= $0, H =< $9 ->
    Digit = H - $0,
    NewAcc = Acc * 10 + Digit,
    parse_number(T, NewAcc);
parse_number(Chars, Acc) ->
    {Acc, Chars}.
