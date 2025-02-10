% #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Udemy_Arrays
% #Big_O_Time_O(n)_Space_O(n) #2025_01_12_Time_151_ms_(100.00%)_Space_149.20_MB_(100.00%)

-spec first_missing_positive(Nums :: [integer()]) -> integer().
first_missing_positive(Nums) ->
    ets:new(hashmap, [named_table, ordered_set]),
    insert_to_hashmap(Nums),
    Res = find_1st_missing_pos(ets:tab2list(hashmap), 1),
    ets:delete(hashmap),
    Res.

insert_to_hashmap([]) ->
    ok;
insert_to_hashmap([H | T]) when H > 0 ->
    ets:insert(hashmap, {H, valid}),
    insert_to_hashmap(T);
insert_to_hashmap([_ | T]) ->
    insert_to_hashmap(T).

find_1st_missing_pos([], CurPos) ->
    CurPos;
find_1st_missing_pos([{H, valid} | T], H) ->
    find_1st_missing_pos(T, H + 1);
find_1st_missing_pos(_, CurPos) ->
    CurPos.
