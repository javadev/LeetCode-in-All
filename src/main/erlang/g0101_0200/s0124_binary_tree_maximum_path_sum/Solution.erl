% #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Depth_First_Search
% #Tree #Binary_Tree #Udemy_Tree_Stack_Queue #Top_Interview_150_Binary_Tree_General
% #Big_O_Time_O(N)_Space_O(N) #2025_01_16_Time_4_(100.00%)_Space_89.51_(100.00%)

%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec max_path_sum(Root :: #tree_node{} | null) -> integer().
max_path_sum(#tree_node{val = Val, left = null, right = null}) ->
    Val;
max_path_sum(Root) ->
    element(2, max_path(Root, -1001)).

-spec max_path(Node :: #tree_node{} | null, Max :: integer()) -> {integer(), integer()}.
max_path(null, Max) ->
    {0, Max};
max_path(#tree_node{val = Val, left = Left, right = Right}, Max) ->
    {LVal, LMax} = max_path(Left, Max),
    {RVal, RMax} = max_path(Right, Max),
    LocalMax = lists:max([LVal + Val, RVal + Val, Val]),
    GlobalMax = lists:max([Max, Val, Val + LVal, Val + RVal, Val + LVal + RVal, LMax, RMax]),
    {LocalMax, GlobalMax}.
