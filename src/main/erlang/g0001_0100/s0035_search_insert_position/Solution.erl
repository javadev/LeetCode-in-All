% #Easy #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_I_Day_1_Binary_Search
% #Binary_Search_I_Day_2 #Top_Interview_150_Binary_Search #Big_O_Time_O(log_n)_Space_O(1)
% #2025_01_12_Time_0_ms_(100.00%)_Space_64.33_MB_(_%)

-spec search_insert(Nums :: [integer()], Target :: integer()) -> integer().
search_insert(Nums, Target) ->
  search_insert(Nums, Target, 1, length(Nums)) - 1.

search_insert(Nums, Target, Low, High) when Low > High ->
    Low;

search_insert(Nums, Target, Low, High) ->
    Mid = Low + (High - Low) div 2,
    Mid_value = lists:nth(Mid, Nums),
    Result = if
                 Mid_value == Target -> Mid;
                 Mid_value > Target -> search_insert(Nums, Target, Low, Mid - 1);
                 true -> search_insert(Nums, Target, Mid + 1, High)
            end.
