% #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Linked_List #Recursion
% #Data_Structure_I_Day_7_Linked_List #Algorithm_I_Day_10_Recursion_Backtracking
% #Level_1_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(m+n)_Space_O(m+n)
% #2025_01_11_Time_0_(100.00%)_Space_62.80_(66.67%)

%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

%% Merge two sorted linked lists
-spec merge_two_lists(List1 :: #list_node{} | null, List2 :: #list_node{} | null) -> #list_node{} | null.
merge_two_lists(null, List2) ->
    List2;
merge_two_lists(List1, null) ->
    List1;
merge_two_lists(List1, List2) ->
    case List1#list_node.val =< List2#list_node.val of
        true ->
            List1#list_node{next = merge_two_lists(List1#list_node.next, List2)};
        false ->
            List2#list_node{next = merge_two_lists(List1, List2#list_node.next)}
    end.
