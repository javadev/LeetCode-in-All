% #Medium #Dynamic_Programming #Math #Tree #Binary_Tree #Binary_Search_Tree
% #Dynamic_Programming_I_Day_11 #Big_O_Time_O(n)_Space_O(1)
% #2025_01_14_Time_0_(100.00%)_Space_58.68_(100.00%)

-spec num_trees(N :: integer()) -> integer().
num_trees(N) ->
    Result = calculate_num_trees(N, 0, 1),
    Result div (N + 1).

-spec calculate_num_trees(N :: integer(), I :: integer(), Acc :: integer()) -> integer().
calculate_num_trees(N, I, Acc) when I >= N ->
    Acc;
calculate_num_trees(N, I, Acc) ->
    calculate_num_trees(
        N,
        I + 1,
        (Acc * (2 * N - I)) div (I + 1)
    ).
