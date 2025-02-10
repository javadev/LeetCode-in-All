% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search
% #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_5 #Top_Interview_150_Binary_Search
% #Big_O_Time_O(log_n)_Space_O(1) #2025_01_12_Time_1_ms_(100.00%)_Space_69.07_MB_(100.00%)

-spec search_range(Nums :: [integer()], Target :: integer()) -> [integer()].
search_range(Nums, Target) ->
    [helper(Nums, Target, false), helper(Nums, Target, true)].

-spec helper(Nums :: [integer()], Target :: integer(), Equals :: boolean()) -> integer().
helper(Nums, Target, Equals) ->
    helper(Nums, Target, Equals, 0, length(Nums) - 1, -1).

-spec helper(Nums :: [integer()], Target :: integer(), Equals :: boolean(), L :: integer(), R :: integer(), Result :: integer()) -> integer().
helper(_, _, _, L, R, Result) when L > R ->
    Result;
helper(Nums, Target, Equals, L, R, Result) ->
    Mid = L + (R - L) div 2,
    MidValue = lists:nth(Mid + 1, Nums), % Erlang lists are 1-based
    NewResult = 
        case MidValue == Target of
            true -> Mid;
            false -> Result
        end,
    case MidValue < Target orelse (MidValue == Target andalso Equals) of
        true -> helper(Nums, Target, Equals, Mid + 1, R, NewResult);
        false -> helper(Nums, Target, Equals, L, Mid - 1, NewResult)
    end.
