% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #String #Hash_Table #Sorting
% #Data_Structure_II_Day_8_String #Programming_Skills_II_Day_11 #Udemy_Strings
% #Big_O_Time_O(n*k_log_k)_Space_O(n) #2025_01_12_Time_23_(_%)_Space_73.88_(100.00%)

-spec group_anagrams(Strs :: [unicode:unicode_binary()]) -> [[unicode:unicode_binary()]].
group_anagrams(Strs) ->
    group_anagrams(Strs, dict:new()).

-spec group_anagrams(Strs :: [unicode:unicode_binary()], Acc :: dict:dict()) -> [[unicode:unicode_binary()]].
group_anagrams([], Acc) ->
    dict:fold(fun(_, Val, AccAcc) -> [Val | AccAcc] end, [], Acc);
group_anagrams([Word | Rest], Acc) ->
    Key = create_key(Word),
    NewAcc = case dict:find(Key, Acc) of
                {ok, List} -> dict:store(Key, [Word | List], Acc);
                error -> dict:store(Key, [Word], Acc)
              end,
    group_anagrams(Rest, NewAcc).

-spec create_key(Word :: unicode:unicode_binary()) -> unicode:unicode_binary().
create_key(Word) ->
    CharList = unicode:characters_to_list(Word),  % Convert the binary string to a list of characters
    SortedList = lists:sort(CharList),            % Sort the characters to create a canonical key
    list_to_binary(SortedList).                   % Convert back to binary for the dictionary key
