% #Easy #Top_100_Liked_Questions #Two_Pointers #Stack #Linked_List #Recursion
% #Level_2_Day_3_Linked_List #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
% #2025_01_19_Time_25_ms_(100.00%)_Space_109.06_MB_(100.00%)

%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec is_palindrome(Head :: #list_node{} | null) -> boolean().
-import(lists,[reverse/1]). 

list_to_seq(null) -> [];
list_to_seq(Head) ->
    [Head#list_node.val] ++ list_to_seq(Head#list_node.next).

is_palindrome(null) -> false;
is_palindrome(Head) ->
    Seq = list_to_seq(Head),
    Seq =:= reverse(Seq).
