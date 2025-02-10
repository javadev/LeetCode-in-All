% #Medium #String #Top_Interview_150_Array/String
% #2025_01_08_Time_203_ms_(100.00%)_Space_60.52_MB_(100.00%)

%% Define the function specification
-spec convert(S :: unicode:unicode_binary(), NumRows :: integer()) -> unicode:unicode_binary().
convert(S, NumRows) ->
    %% Convert the input string to a list of characters
    CharList = unicode:characters_to_list(S),
    Length = length(CharList),
    %% Handle edge cases
    if
        NumRows == 1; NumRows >= Length ->
            S;
        true ->
            %% Initialize a list of empty lists (rows) with length NumRows
            Rows = lists:map(fun(_) -> [] end, lists:seq(1, NumRows)),
            %% Build the zigzag pattern
            ZigzagRows = build_zigzag(CharList, Rows, 0, true),
            %% Concatenate all rows to form the result
            unicode:characters_to_binary(lists:append(ZigzagRows))
    end.

%% Recursive function to build zigzag rows
-spec build_zigzag([integer()], [[integer()]], integer(), boolean()) -> [[integer()]].
build_zigzag([], Rows, _, _) ->
    Rows;
build_zigzag([Char | Rest], Rows, CurrentRow, GoingDown) ->
    %% Add the character to the current row
    UpdatedRows = update_row(Rows, CurrentRow, Char),
    %% Determine the new direction and row index
    {NewDirection, NewRow} = case {CurrentRow, GoingDown} of
        {0, _} -> {true, 1};
        {Row, _} when Row == length(Rows) - 1 -> {false, Row - 1};
        {Row, true} -> {true, Row + 1};
        {Row, false} -> {false, Row - 1}
    end,
    %% Recursively build the zigzag pattern
    build_zigzag(Rest, UpdatedRows, NewRow, NewDirection).

%% Helper function to update the row with the new character
-spec update_row([[integer()]], integer(), integer()) -> [[integer()]].
update_row(Rows, Index, Char) ->
    lists:sublist(Rows, Index) ++ [lists:nth(Index + 1, Rows) ++ [Char]] ++ lists:nthtail(Index + 1, Rows).
