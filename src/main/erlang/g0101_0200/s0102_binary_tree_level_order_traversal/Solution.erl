% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Breadth_First_Search #Tree
% #Binary_Tree #Data_Structure_I_Day_11_Tree #Level_1_Day_6_Tree #Udemy_Tree_Stack_Queue
% #Big_O_Time_O(N)_Space_O(N) #2025_01_15_Time_12_(100.00%)_Space_65.00_(100.00%)

%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec level_order(Root :: #tree_node{} | null) -> [[integer()]].
level_order(Root) ->
  do({[Root], []}, {[], []}).

do({[], []}, {Last, []}) ->
    Last;
do({[], NextLevel}, {Last, Acc}) ->
    do({NextLevel, []}, {Last ++ [lists:reverse(Acc)], []});
do({[Node| Rest], NextLevel}, {Last, Acc}) ->
    case Node of 
        null ->
            do({Rest, NextLevel}, {Last, Acc});
        #tree_node{left = Left, val = Val, right=Right} ->
            do({Rest , NextLevel ++ [Left, Right]}, {Last, [Val| Acc]})
    end.
