% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Union_Find
% #Top_Interview_150_Hashmap #Big_O_Time_O(N_log_N)_Space_O(1)
% #2025_01_16_Time_42_ms_(100.00%)_Space_206.53_MB_(100.00%)

-spec longest_consecutive(Nums :: [integer()]) -> integer().
longest_consecutive(Nums) ->
    Sorted = lists:sort(Nums),
    SeqLens = count_consecutive(Sorted, [1]),
    lists:max(SeqLens).

-spec count_consecutive(Nums :: [integer()], SeqLens :: [integer()]) -> [integer()].
count_consecutive([H1, H2 | Tail], [SeqHead | SeqTail]) ->
    NewLen = case H1 - H2 of
        -1 -> SeqHead + 1; % Consecutive elements
         0 -> SeqHead;     % Same element, do nothing
         _ -> 1            % Not consecutive, reset count
    end,
    count_consecutive([H2 | Tail], [NewLen | [SeqHead | SeqTail]]);
count_consecutive([_], SeqLens) ->
    SeqLens; % End of list with remaining sequence lengths
count_consecutive([], [_]) ->
    [0]. % Single number case
