% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Tree #Binary_Tree
% #Binary_Search_Tree #Data_Structure_I_Day_14_Tree #Level_1_Day_8_Binary_Search_Tree
% #Udemy_Tree_Stack_Queue #Top_Interview_150_Binary_Search_Tree #Big_O_Time_O(N)_Space_O(log(N))
% #2025_01_14_Time_0_ms_(100.00%)_Space_73.36_MB_(100.00%)

%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec is_valid_bst(Root :: #tree_node{} | null) -> boolean().
is_valid_bst(Tree) ->
   is_valid_bst(null, Tree,  null).

in_range(null, Middle, null) ->
    true;

in_range(Min, Middle, null) ->
    Min < Middle;

in_range(null, Middle, Max) ->
    Middle < Max;

in_range(Min, Middle, Max) ->
    (Min < Middle) and (Middle < Max).

is_valid_bst(Min, null, Max) ->
    true;
is_valid_bst(Min, #tree_node{val = Val, left = Left, right = Right}, Max) ->
    in_range(Min, Val, Max) andalso
            is_valid_bst(Min, Left, Val) andalso 
                is_valid_bst(Val, Right, Max).
