% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
% #Backtracking #Big_O_Time_O(N*2^N)_Space_O(2^N*N)
% #2025_01_16_Time_24_ms_(100.00%)_Space_86.40_MB_(100.00%)

-spec partition(S :: unicode:unicode_binary()) -> [[unicode:unicode_binary()]].
partition(S) ->
    Len = byte_size(S),
    dfs(S, Len, 0, [], []).

% Base case: when we've processed the entire string
dfs(_S, Len, L, Subs, Ans) when L =:= Len ->
    [lists:reverse(Subs) | Ans];

% Recursive case: try all possible partitions
dfs(S, Len, L, Subs, Ans) ->
    partition_from_position(S, Len, L, L, Subs, Ans).

partition_from_position(S, Len, L, R, Subs, Ans) when R < Len ->
    Substring = binary:part(S, L, R - L + 1),
    NewAns = case is_palindrome(Substring) of
        true -> 
            dfs(S, Len, R + 1, [Substring | Subs], Ans);
        false -> 
            Ans
    end,
    partition_from_position(S, Len, L, R + 1, Subs, NewAns);
partition_from_position(_S, _Len, _L, _R, _Subs, Ans) ->
    Ans.

% Helper function to check if a binary is a palindrome
is_palindrome(Bin) ->
    List = binary_to_list(Bin),
    List =:= lists:reverse(List).
