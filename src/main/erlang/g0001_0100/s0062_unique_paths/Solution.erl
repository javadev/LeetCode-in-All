% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Math
% #Combinatorics #Algorithm_II_Day_13_Dynamic_Programming #Dynamic_Programming_I_Day_15
% #Level_1_Day_11_Dynamic_Programming #Big_O_Time_O(m*n)_Space_O(m*n)
% #2025_01_13_Time_0_ms_(100.00%)_Space_58.34_MB_(100.00%)

-spec unique_paths(M :: integer(), N :: integer()) -> integer().
unique_paths(M, N) ->
    Ncr = fun(N, R) ->
        lists:foldl(
          fun(I, Acc) -> 
              (Acc * (I + N - R)) div I
          end, 
          1, 
          lists:seq(1, R)
        )
    end,
    Ncr(M + N - 2, erlang:min(M, N) - 1).
