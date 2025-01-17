% #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Breadth_First_Search
% #Tree #Binary_Tree #Data_Structure_I_Day_11_Tree #Level_2_Day_15_Tree
% #Big_O_Time_O(N)_Space_O(log(N)) #2025_01_15_Time_0_(100.00%)_Space_63.92_(_%)

%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec is_symmetric(Root :: #tree_node{} | null) -> boolean().

is_symmetric(null) -> true;
is_symmetric(Root) -> is_symmetric(Root#tree_node.left, Root#tree_node.right).

is_symmetric(null, null) -> true;
is_symmetric(null, _) -> false;
is_symmetric(_, null) -> false;
is_symmetric(L, R) -> 
    is_symmetric(L#tree_node.left, R#tree_node.right)
     and (L#tree_node.val == R#tree_node.val) 
     and is_symmetric(R#tree_node.left, L#tree_node.right).
