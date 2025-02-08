% #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Heap_Priority_Queue #Linked_List
% #Divide_and_Conquer #Merge_Sort #Top_Interview_150_Divide_and_Conquer
% #Big_O_Time_O(k*n*log(k))_Space_O(log(k)) #2025_01_11_Time_93_(100.00%)_Space_71.11_(100.00%)

%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

%% Merge k sorted linked lists
-spec merge_k_lists(Lists :: [#list_node{} | null]) -> #list_node{} | null.
merge_k_lists([]) ->
    null;
merge_k_lists(Lists) ->
    merge_k_lists(Lists, 0, length(Lists)).

%% Divide and conquer helper function
-spec merge_k_lists(Lists :: [#list_node{} | null], Left :: integer(), Right :: integer()) -> #list_node{} | null.
merge_k_lists(Lists, Left, Right) when Right > Left + 1 ->
    Mid = (Left + Right) div 2,
    LeftList = merge_k_lists(Lists, Left, Mid),
    RightList = merge_k_lists(Lists, Mid, Right),
    merge_two_lists(LeftList, RightList);
merge_k_lists(Lists, Left, _Right) ->
    lists:nth(Left + 1, Lists).

%% Merge two sorted lists
-spec merge_two_lists(Left :: #list_node{} | null, Right :: #list_node{} | null) -> #list_node{} | null.
merge_two_lists(null, Right) ->
    Right;
merge_two_lists(Left, null) ->
    Left;
merge_two_lists(Left = #list_node{val = LeftVal}, Right = #list_node{val = RightVal}) ->
    case LeftVal =< RightVal of
        true ->
            Left#list_node{next = merge_two_lists(Left#list_node.next, Right)};
        false ->
            Right#list_node{next = merge_two_lists(Left, Right#list_node.next)}
    end.
