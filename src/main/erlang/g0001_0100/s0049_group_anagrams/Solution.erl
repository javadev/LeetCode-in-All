% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #String #Hash_Table #Sorting
% #Data_Structure_II_Day_8_String #Programming_Skills_II_Day_11 #Udemy_Strings
% #Top_Interview_150_Hashmap #Big_O_Time_O(n*k_log_k)_Space_O(n)
% #2025_01_15_Time_13_(90.00%)_Space_73.34_(100.00%)

-spec group_anagrams(Strs :: [unicode:unicode_binary()]) -> [[unicode:unicode_binary()]].
group_anagrams(Strs) ->
    AnagramMap = group_anagrams_helper(Strs, #{}),
    maps:values(AnagramMap).

group_anagrams_helper([Head | Tail], Acc) ->
    NewString = sort_string(Head),
    NewMap = case maps:is_key(NewString, Acc) of
        true ->
            maps:update(NewString, [Head | maps:get(NewString, Acc)], Acc);
        false ->
            maps:put(NewString, [Head], Acc)
    end,
    group_anagrams_helper(Tail, NewMap);
group_anagrams_helper([], Acc) ->
    Acc.

sort_string(Str) ->
    StrList = binary_to_list(Str),        % Convert string to list of characters
    SortedList = lists:sort(StrList),       % Sort the list of characters
    list_to_binary(SortedList).
