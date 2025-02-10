% #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Linked_List #Recursion
% #Data_Structure_I_Day_8_Linked_List #Algorithm_I_Day_10_Recursion_Backtracking
% #Level_1_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(N)_Space_O(1)
% #2025_01_18_Time_0_ms_(100.00%)_Space_64.38_MB_(100.00%)

%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec reverse_list(Head :: #list_node{} | null) -> #list_node{} | null.
reverse_list(null) -> null;
reverse_list(#list_node{val=V, next=Next}) -> reverse_list(Next, #list_node{val=V, next=null}).
reverse_list(null, Acc) -> Acc;
reverse_list(#list_node{val=V,next=Next}, Acc) -> reverse_list(Next, #list_node{val=V, next=Acc}).
