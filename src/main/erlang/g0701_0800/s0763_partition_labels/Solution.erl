% #Medium #String #Hash_Table #Greedy #Two_Pointers #Data_Structure_II_Day_7_String
% #Big_O_Time_O(n)_Space_O(1) #2025_01_15_Time_5_ms_(100.00%)_Space_59.70_MB_(100.00%)

-spec partition_labels(binary()) -> [integer()].
partition_labels(S) when is_binary(S) ->
    Letters = binary_to_list(S),
    % Create an array to store the last position of each letter
    LastPos = find_last_positions(Letters, array:new(26, {default, -1})),
    % Partition the string
    create_partitions(Letters, LastPos, 0, 0, -1, []).

% Helper function to find the last position of each letter
find_last_positions(Letters, Position) ->
    find_last_positions(Letters, Position, 0).
find_last_positions([], Position, _) ->
    Position;
find_last_positions([Letter | Rest], Position, Index) ->
    UpdatedPosition = array:set(Letter - $a, Index, Position),
    find_last_positions(Rest, UpdatedPosition, Index + 1).

% Function to create partitions
create_partitions([], _, _, _, Prev, Result) ->
    lists:reverse(Result);
create_partitions([Letter | Rest], LastPos, Index, Max, Prev, Result) ->
    CurrentMax = array:get(Letter - $a, LastPos),
    NewMax = max(Max, CurrentMax),
    case Index of
        NewMax ->
            NewResult = [Index - Prev | Result],
            create_partitions(Rest, LastPos, Index + 1, 0, Index, NewResult);
        _ ->
            create_partitions(Rest, LastPos, Index + 1, NewMax, Prev, Result)
    end.

% Utility function for finding the maximum of two numbers
max(A, B) when A >= B -> A;
max(_, B) -> B.
