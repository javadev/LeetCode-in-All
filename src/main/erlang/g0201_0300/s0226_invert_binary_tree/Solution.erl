% #Easy #Top_100_Liked_Questions #Depth_First_Search #Breadth_First_Search #Tree #Binary_Tree
% #Data_Structure_I_Day_12_Tree #Level_2_Day_6_Tree #Udemy_Tree_Stack_Queue
% #Top_Interview_150_Binary_Tree_General #Big_O_Time_O(n)_Space_O(n)
% #2025_01_19_Time_0_(100.00%)_Space_62.15_(100.00%)

%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec invert_tree(Root :: #tree_node{} | null) -> #tree_node{} | null.
invert_tree(null) ->
    null;
invert_tree(#tree_node{left=Left, right=Right}= Cat)->
    Cat#tree_node{left=invert_tree(Right), right=invert_tree(Left)}.
