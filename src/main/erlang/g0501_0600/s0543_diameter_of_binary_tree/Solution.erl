% #Easy #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Level_2_Day_7_Tree
% #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
% #2025_01_22_Time_485_ms_(100.00%)_Space_74.78_MB_(100.00%)

%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec diameter_of_binary_tree(Root :: #tree_node{} | null) -> integer().

depth(null) -> 0;
depth(Root) -> 
    1 + max(depth(Root#tree_node.left), depth(Root#tree_node.right)).

diameter_of_binary_tree(null) -> 0;
diameter_of_binary_tree(Root) ->
    max(
        max(
            diameter_of_binary_tree(Root#tree_node.left), 
            diameter_of_binary_tree(Root#tree_node.right)
        ),
        depth(Root#tree_node.left) + depth(Root#tree_node.right)
    ).
