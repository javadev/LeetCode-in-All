% #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Tree #Binary_Tree
% #Stack #Data_Structure_I_Day_10_Tree #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
% #2025_01_14_Time_0_ms_(100.00%)_Space_63.09_MB_(_%)

%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec inorder_traversal(Root :: #tree_node{} | null) -> [integer()].
inorder_traversal(null) -> [];
inorder_traversal(R = #tree_node{val = V, left = null, right = null}) -> [V]; 
inorder_traversal(Root) ->
    inorder_traversal(Root#tree_node.left) ++ [Root#tree_node.val] ++ inorder_traversal(Root#tree_node.right).
