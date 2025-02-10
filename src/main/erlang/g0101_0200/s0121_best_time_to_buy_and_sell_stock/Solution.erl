% #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
% #Data_Structure_I_Day_3_Array #Dynamic_Programming_I_Day_7 #Level_1_Day_5_Greedy #Udemy_Arrays
% #Top_Interview_150_Array/String #Big_O_Time_O(N)_Space_O(1)
% #2025_01_15_Time_89_ms_(100.00%)_Space_115.84_MB_(100.00%)

-spec max_profit(Prices :: [integer()]) -> integer().
-import(lists, [max/1, min/1]).

max_profit([H|T]) ->
    max_prof(H, 0, T).

max_prof(Min, Max, []) -> Max;
max_prof(Min, Max, [H|T]) ->
    max_prof(min([Min, H]), max([Max, H-Min]), T).
