% #Medium #String #Dynamic_Programming #Big_O_Time_O(n^2)_Space_O(n)
% #2025_01_11_Time_17_(100.00%)_Space_59.16_(100.00%)

-spec count_substrings(S :: binary()) -> integer().
count_substrings(S) ->
    TupleS = list_to_tuple(unicode:characters_to_list(S)),
    get_count(TupleS, 0, 0).

-spec get_count(TupleS :: tuple(), Count :: integer(), I :: integer()) -> integer().
get_count(TupleS, Count, I) when I >= tuple_size(TupleS) ->
    Count;
get_count(TupleS, Count, I) ->
    Left = I,
    Right = I,
    Count1 = Count + while(TupleS, 0, Left, Right),
    Left1 = I,
    Right1 = I + 1,
    Count2 = Count1 + while(TupleS, 0, Left1, Right1),
    get_count(TupleS, Count2, I + 1).

-spec while(TupleS :: tuple(), Acc :: integer(), Left :: integer(), Right :: integer()) -> integer().
while(TupleS, Acc, Left, Right) when Left < 0; Right >= tuple_size(TupleS); element(Left + 1, TupleS) /= element(Right + 1, TupleS) ->
    Acc;
while(TupleS, Acc, Left, Right) ->
    while(TupleS, Acc + 1, Left - 1, Right + 1).
