% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming #Greedy
% #Algorithm_II_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_4 #Udemy_Arrays
% #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(1)
% #2025_01_12_Time_2_(100.00%)_Space_77.54_(100.00%)

-spec can_jump(Nums :: [integer()]) -> boolean().
can_jump([E|Nums]) ->
  do(Nums, 1, E).


do([E|Nums], Index, Maxindex) when Index=<Maxindex  ->
    do(Nums, Index+1, max(Index+E, Maxindex));
do([], Index, MaxIndex) when MaxIndex>=Index-1 ->
    true;
do(_, _, _) ->
    false.
