% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Depth_First_Search
% #Breadth_First_Search #Matrix #Union_Find
% #Algorithm_II_Day_6_Breadth_First_Search_Depth_First_Search
% #Graph_Theory_I_Day_1_Matrix_Related_Problems #Level_1_Day_9_Graph/BFS/DFS #Udemy_Graph
% #Top_Interview_150_Graph_General #Big_O_Time_O(M*N)_Space_O(M*N)
% #2025_01_21_Time_350_ms_(100.00%)_Space_110.42_MB_(100.00%)

-spec num_islands([[char()]]) -> integer().
num_islands(Grid) ->
    Table = ets:new(grid, []),
    lists:foreach(
      fun({Row, I}) ->
          lists:foreach(
            fun({X, J}) when X =:= $1 ->
                ets:insert(Table, {{I, J}});
               (_) -> ok
            end,
            lists:zip(Row, lists:seq(0, length(Row) - 1))
          )
      end,
      lists:zip(Grid, lists:seq(0, length(Grid) - 1))
    ),
    count(Table, 0).

count(Table, Ans) ->
    case ets:first(Table) of
        '$end_of_table' -> Ans;
        {I, J} ->
            sink_island(Table, {I, J}),
            count(Table, Ans + 1)
    end.

sink_island(Table, {I, J}) ->
    case ets:member(Table, {I, J}) of
        true ->
            ets:delete(Table, {I, J}),
            sink_island(Table, {I - 1, J}),
            sink_island(Table, {I + 1, J}),
            sink_island(Table, {I, J - 1}),
            sink_island(Table, {I, J + 1});
        false -> ok
    end.
