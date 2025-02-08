% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search
% #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_11 #Level_2_Day_8_Binary_Search
% #Udemy_Binary_Search #Top_Interview_150_Binary_Search #Big_O_Time_O(log_n)_Space_O(1)
% #2025_01_12_Time_0_(100.00%)_Space_61.27_(100.00%)

-spec search(Nums :: [integer()], Target :: integer()) -> integer().

search(Nums, Target) ->
    search(Nums, Target, 0, length(Nums) - 1).

search(_, _, L, R) when L > R -> -1;
search(Nums, Target, L, R) ->
    Mid = (L + R) div 2,
    Val = lists:nth(Mid + 1, Nums),
    Start = lists:nth(L + 1, Nums),
    case Val of
        Target -> Mid;
        _ -> 
            if 
                (Val >= Start andalso Target >= Start andalso Target < Val) 
                orelse (Val < Start andalso (Target >= Start orelse Target < Val)) ->
                    search(Nums, Target, L, Mid - 1);
                true ->
                    search(Nums, Target, Mid + 1, R)
            end
    end.
