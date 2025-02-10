% #Medium #Depth_First_Search #Tree #Binary_Tree #Level_2_Day_7_Tree #Big_O_Time_O(n)_Space_O(n)
% #2025_01_22_Time_45_ms_(100.00%)_Space_104.65_MB_(100.00%)

%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec path_sum(Root :: #tree_node{} | null, TargetSum :: integer()) -> integer().
path_sum(null, _TargetSum) -> 0;
path_sum(Root, TargetSum) ->
    path_sum(Root, TargetSum, []).

path_sum(null, _TargetSum, _PartialSums) -> 0;
path_sum(Root, TargetSum, PartialSums) ->
    NewPartials = [Root#tree_node.val | [Sum + Root#tree_node.val || Sum <- PartialSums]],
    EqualPaths = length([Sum || Sum <- NewPartials, Sum =:= TargetSum]),
    EqualPaths + 
        path_sum(Root#tree_node.left, TargetSum, NewPartials) + 
        path_sum(Root#tree_node.right, TargetSum, NewPartials).
