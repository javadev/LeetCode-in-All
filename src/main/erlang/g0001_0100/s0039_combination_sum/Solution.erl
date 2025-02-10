% #Medium #Top_100_Liked_Questions #Array #Backtracking #Algorithm_II_Day_10_Recursion_Backtracking
% #Level_2_Day_20_Brute_Force/Backtracking #Udemy_Backtracking/Recursion
% #Top_Interview_150_Backtracking #Big_O_Time_O(2^n)_Space_O(n+2^n)
% #2025_01_12_Time_0_ms_(100.00%)_Space_58.87_MB_(100.00%)

-spec combination_sum(Candidates :: [integer()], Target :: integer()) -> [[integer()]].

f(_, Target, _, Acc) when Target < 0 -> Acc;
f(_, Target, Cur, Acc) when Target =:= 0 -> [Cur|Acc];
f([], Target, Cur, Acc) when Target > 0 -> Acc;
f([A|B], Target, Cur, Acc) when Target > 0 ->
    f(B,Target,Cur,f([A|B],Target-A,[A|Cur],Acc)).

combination_sum(Candidates, Target) ->
  f(Candidates, Target, [], []).
