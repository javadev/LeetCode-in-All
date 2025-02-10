% #Medium #Top_100_Liked_Questions #Linked_List #Recursion #Data_Structure_II_Day_12_Linked_List
% #Udemy_Linked_List #Big_O_Time_O(n)_Space_O(1)
% #2025_01_11_Time_0_ms_(100.00%)_Space_62.72_MB_(100.00%)

%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

%% Swap every two adjacent nodes in a linked list
-spec swap_pairs(Head :: #list_node{} | null) -> #list_node{} | null.
swap_pairs(null) -> null;
swap_pairs(#list_node{next = null} = Head) -> Head;
swap_pairs(First = #list_node{next = Second}) ->
    NextPair = Second#list_node.next,
    % Connect second node to first
    Second#list_node{
        next = First#list_node{
            % Connect first node to result of swapping remaining pairs
            next = swap_pairs(NextPair)
        }
    }.
