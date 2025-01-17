% #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Breadth_First_Search
% #Tree #Binary_Tree #Data_Structure_I_Day_11_Tree
% #Programming_Skills_I_Day_10_Linked_List_and_Tree #Udemy_Tree_Stack_Queue
% #Big_O_Time_O(N)_Space_O(H) #2025_01_15_Time_0_(100.00%)_Space_67.90_(50.00%)

%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec max_depth(Root :: #tree_node{} | null) -> integer().
max_depth(null) ->
    0;  % If the tree is empty, its depth is 0.
max_depth(#tree_node{left = Left, right = Right}) ->
    % Find the maximum depth of the left and right subtrees, then add 1.
    1 + max(max_depth(Left), max_depth(Right)).
