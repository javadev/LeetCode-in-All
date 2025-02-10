% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table
% #Dynamic_Programming #Trie #Memoization #Algorithm_II_Day_15_Dynamic_Programming
% #Dynamic_Programming_I_Day_9 #Udemy_Dynamic_Programming #Top_Interview_150_1D_DP
% #Big_O_Time_O(M+max*N)_Space_O(M+N+max) #2025_01_18_Time_1_ms_(100.00%)_Space_60.03_MB_(100.00%)

-spec word_break(S :: unicode:unicode_binary(), WordDict :: [unicode:unicode_binary()]) -> boolean().
word_break(S, WordDict) ->
    % Initialize ETS table for memoization
    ets:new(memo, [set, named_table]),
    % Process word dict to include sizes
    Words = [{Word, byte_size(Word)} || Word <- WordDict],
    % Get result
    Result = breakable(S, Words),
    % Clean up
    ets:delete(memo),
    Result.

-spec breakable(binary(), [{binary(), integer()}]) -> boolean().
breakable(<<>>, _Words) ->
    true;
breakable(S, Words) ->
    case ets:lookup(memo, S) of
        [{_, Result}] ->
            Result;
        [] ->
            Result = try_words(S, Words, Words),
            ets:insert(memo, {S, Result}),
            Result
    end.

try_words(_S, [], _AllWords) ->
    false;
try_words(S, [{Word, Len} | Rest], AllWords) ->
    case S of
        <<Prefix:Len/binary, Remaining/binary>> when Prefix =:= Word ->
            case breakable(Remaining, AllWords) of
                true -> true;
                false -> try_words(S, Rest, AllWords)
            end;
        _ ->
            try_words(S, Rest, AllWords)
    end.
