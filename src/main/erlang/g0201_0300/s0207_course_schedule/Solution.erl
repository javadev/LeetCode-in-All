% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search
% #Breadth_First_Search #Graph #Topological_Sort #Big_O_Time_O(N)_Space_O(N)
% #2025_01_19_Time_220_(100.00%)_Space_67.41_(100.00%)

-define(WHITE, 0).
-define(GRAY, 1).
-define(BLACK, 2).

-spec can_finish(NumCourses :: integer(), Prerequisites :: [[integer()]]) -> boolean().
can_finish(NumCourses, Prerequisites) ->
    % Create adjacency list as a list of lists instead of a map
    AdjList = create_adj_list(NumCourses, Prerequisites),
    % Use array for colors instead of map
    Colors = array:new(NumCourses, {default, ?WHITE}),
    % Check for cycles
    not has_cycle_in_graph(AdjList, Colors, 0, NumCourses).

-spec create_adj_list(NumCourses :: integer(), Prerequisites :: [[integer()]]) -> [[integer()]].
create_adj_list(NumCourses, Prerequisites) ->
    % Initialize empty lists for each course
    EmptyAdj = [[] || _ <- lists:seq(1, NumCourses)],
    % Fill adjacency lists
    lists:foldl(
        fun([To, From], Acc) ->
            lists:sublist(Acc, From) ++ 
            [[To | lists:nth(From + 1, Acc)]] ++ 
            lists:nthtail(From + 1, Acc)
        end,
        EmptyAdj,
        Prerequisites
    ).

-spec has_cycle_in_graph([[integer()]], array:array(), integer(), integer()) -> boolean().
has_cycle_in_graph(_AdjList, _Colors, Current, NumCourses) when Current >= NumCourses ->
    false;
has_cycle_in_graph(AdjList, Colors, Current, NumCourses) ->
    case array:get(Current, Colors) =:= ?WHITE andalso length(lists:nth(Current + 1, AdjList)) > 0 of
        true ->
            case dfs(AdjList, Colors, Current) of
                {true, _} -> true;
                {false, NewColors} ->
                    has_cycle_in_graph(AdjList, NewColors, Current + 1, NumCourses)
            end;
        false ->
            has_cycle_in_graph(AdjList, Colors, Current + 1, NumCourses)
    end.

-spec dfs([[integer()]], array:array(), integer()) -> {boolean(), array:array()}.
dfs(AdjList, Colors, Node) ->
    Colors1 = array:set(Node, ?GRAY, Colors),
    Neighbors = lists:nth(Node + 1, AdjList),
    check_neighbors(AdjList, Neighbors, Colors1, Node).

-spec check_neighbors([[integer()]], [integer()], array:array(), integer()) -> {boolean(), array:array()}.
check_neighbors(_, [], Colors, Node) ->
    {false, array:set(Node, ?BLACK, Colors)};
check_neighbors(AdjList, [Neighbor|Rest], Colors, Node) ->
    case array:get(Neighbor, Colors) of
        ?GRAY ->
            {true, Colors};
        ?WHITE ->
            case dfs(AdjList, Colors, Neighbor) of
                {true, NewColors} -> {true, NewColors};
                {false, NewColors} ->
                    check_neighbors(AdjList, Rest, NewColors, Node)
            end;
        ?BLACK ->
            check_neighbors(AdjList, Rest, Colors, Node)
    end.
