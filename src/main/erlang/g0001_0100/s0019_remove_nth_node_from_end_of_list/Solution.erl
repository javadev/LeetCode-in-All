% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Two_Pointers #Linked_List
% #Algorithm_I_Day_5_Two_Pointers #Level_2_Day_3_Linked_List #Big_O_Time_O(L)_Space_O(L)
% #2025_01_11_Time_0_(100.00%)_Space_62.72_(100.00%)

%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

%% Remove nth node from end of list
-spec remove_nth_from_end(Head :: #list_node{} | null, N :: integer()) -> #list_node{} | null.
remove_nth_from_end(Head, N) ->
    Dummy = #list_node{val = 0, next = Head},
    {_, Result} = remove_nth(Dummy, N),
    Result#list_node.next.

%% Helper function that returns {RemainingCount, Node}
-spec remove_nth(Node :: #list_node{} | null, N :: integer()) -> {integer(), #list_node{}}.
remove_nth(Node, N) when Node#list_node.next =:= null ->
    {N, Node};
remove_nth(Node, N) ->
    {RemainingCount, UpdatedNext} = remove_nth(Node#list_node.next, N),
    NewCount = RemainingCount - 1,
    
    case NewCount of
        0 -> 
            % Remove the next node by skipping it
            NewNode = Node#list_node{next = UpdatedNext#list_node.next},
            {NewCount, NewNode};
        _ -> 
            % Keep the next node as is
            NewNode = Node#list_node{next = UpdatedNext},
            {NewCount, NewNode}
    end.
