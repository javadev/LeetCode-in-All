% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Design #Trie
% #LeetCode_75_Trie #Level_2_Day_16_Design #Udemy_Trie_and_Heap #Top_Interview_150_Trie
% #Big_O_Time_O(word.length())_or_O(prefix.length())_Space_O(N)
% #2025_01_19_Time_85_ms_(100.00%)_Space_99.16_MB_(100.00%)

% Initialize the trie using ETS
-spec trie_init_() -> any().
trie_init_() ->
    % Create ETS table if it doesn't exist
    case ets:info(trie_table) of
        undefined ->
            ets:new(trie_table, [set, public, named_table]);
        _ ->
            ets:delete(trie_table),
            ets:new(trie_table, [set, public, named_table])
    end.

% Insert a word into the trie
-spec trie_insert(Word :: unicode:unicode_binary()) -> any().
trie_insert(Word) ->
    % Insert all prefixes with false flag
    insert_prefixes(Word),
    % Mark the complete word with true flag
    ets:insert(trie_table, {Word, true}).

% Search for a complete word
-spec trie_search(Word :: unicode:unicode_binary()) -> boolean().
trie_search(Word) ->
    case ets:lookup(trie_table, Word) of
        [{_, true}] -> true;
        _ -> false
    end.

% Check if any word starts with the given prefix
-spec trie_starts_with(Prefix :: unicode:unicode_binary()) -> boolean().
trie_starts_with(Prefix) ->
    case ets:lookup(trie_table, Prefix) of
        [{_, _}] -> true;
        [] -> false
    end.

% Helper function to insert all prefixes of a word
-spec insert_prefixes(Word :: unicode:unicode_binary()) -> ok.
insert_prefixes(Word) ->
    Prefixes = get_all_prefixes(Word),
    [ets:insert_new(trie_table, {Prefix, false}) || Prefix <- Prefixes],`
    ok.

% Helper function to generate all prefixes of a word
-spec get_all_prefixes(Word :: unicode:unicode_binary()) -> [unicode:unicode_binary()].
get_all_prefixes(Word) ->
    Size = byte_size(Word),
    [binary:part(Word, 0, Len) || Len <- lists:seq(1, Size - 1)].

%% Your functions will be called as such:
%% trie_init_(),
%% trie_insert(Word),
%% Param_2 = trie_search(Word),
%% Param_3 = trie_starts_with(Prefix),

%% trie_init_ will be called before every test case, in which you can do some necessary initializations.
