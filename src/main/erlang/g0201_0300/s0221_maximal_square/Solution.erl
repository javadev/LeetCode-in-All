% #Medium #Array #Dynamic_Programming #Matrix #Dynamic_Programming_I_Day_16
% #Top_Interview_150_Multidimensional_DP #Big_O_Time_O(m*n)_Space_O(m*n)
% #2025_01_19_Time_3221_ms_(100.00%)_Space_127.48_MB_(100.00%)

-spec maximal_square(Matrix :: [[char()]]) -> integer().
maximal_square([]) -> 0;
maximal_square([[]|_]) -> 0;
maximal_square(Matrix) ->
    M = length(Matrix),
    N = length(hd(Matrix)),
    
    % Initialize DP array with all zeros
    DP = lists:duplicate(M + 1, lists:duplicate(N + 1, 0)),
    
    % Iterate through matrix and build DP table
    {MaxSquare, _} = lists:foldl(
        fun(I, {MaxSoFar, DPCurrent}) ->
            process_row(I, Matrix, N, MaxSoFar, DPCurrent)
        end,
        {0, DP},
        lists:seq(1, M)
    ),
    
    MaxSquare * MaxSquare.

process_row(I, Matrix, N, MaxSoFar, DP) ->
    lists:foldl(
        fun(J, {CurrentMax, CurrentDP}) ->
            case lists:nth(J, lists:nth(I, Matrix)) of
                $1 ->
                    Val1 = get_dp_value(CurrentDP, I-1, J),
                    Val2 = get_dp_value(CurrentDP, I, J-1),
                    Val3 = get_dp_value(CurrentDP, I-1, J-1),
                    NewVal = 1 + min3(Val1, Val2, Val3),
                    NewDP = set_dp_value(CurrentDP, I, J, NewVal),
                    {max(CurrentMax, NewVal), NewDP};
                _ ->
                    {CurrentMax, CurrentDP}
            end
        end,
        {MaxSoFar, DP},
        lists:seq(1, N)
    ).

get_dp_value(DP, I, J) when I > 0, J > 0 ->
    lists:nth(J + 1, lists:nth(I + 1, DP));
get_dp_value(_, _, _) -> 0.

set_dp_value(DP, I, J, Value) ->
    Row = lists:nth(I + 1, DP),
    NewRow = list_set(Row, J + 1, Value),
    list_set(DP, I + 1, NewRow).

list_set(List, Pos, Value) ->
    {Head, [_|Tail]} = lists:split(Pos - 1, List),
    Head ++ [Value] ++ Tail.

min3(A, B, C) ->
    min(A, min(B, C)).

max(A, B) when A > B -> A;
max(_, B) -> B.
