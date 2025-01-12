% #Hard #Top_100_Liked_Questions #String #Dynamic_Programming #Stack #Big_O_Time_O(n)_Space_O(1)
% #2025_01_12_Time_19_(100.00%)_Space_61.70_(100.00%)

-spec longest_valid_parentheses(S :: unicode:unicode_binary()) -> integer().
longest_valid_parentheses(S) ->
    Max1 = scan(S, 0, 0, 0, 1),
    Max2 = scan(reverse_binary(S), 0, 0, 0, -1),
    max(Max1, Max2).

-spec scan(S :: unicode:unicode_binary(), Left :: integer(), Right :: integer(), Max :: integer(), Direction :: integer()) -> integer().
scan(<<>>, _, _, Max, _) -> 
    Max;
scan(<<Ch, Rest/binary>>, Left, Right, Max, Direction) ->
    {NewLeft, NewRight} = 
        case Ch of
            $( -> {Left + 1, Right};
            $) -> {Left, Right + 1};
            _ -> {Left, Right}
        end,
    NewMax = 
        case NewLeft == NewRight of
            true -> max(Max, NewLeft + NewRight);
            false -> Max
        end,
    {ResetLeft, ResetRight} =
        case Direction of
            1 when NewRight > NewLeft -> {0, 0}; % Reset if right > left in forward scan
            -1 when NewLeft > NewRight -> {0, 0}; % Reset if left > right in backward scan
            _ -> {NewLeft, NewRight}
        end,
    scan(Rest, ResetLeft, ResetRight, NewMax, Direction).

% Helper to reverse a binary string manually.
-spec reverse_binary(S :: binary()) -> binary().
reverse_binary(S) -> 
    reverse_binary(S, <<>>).

-spec reverse_binary(S :: binary(), Acc :: binary()) -> binary().
reverse_binary(<<>>, Acc) -> 
    Acc;
reverse_binary(<<Ch, Rest/binary>>, Acc) -> 
    reverse_binary(Rest, <<Ch, Acc/binary>>).

-spec max(A :: integer(), B :: integer()) -> integer().
max(A, B) when A >= B -> A;
max(_, B) -> B.
