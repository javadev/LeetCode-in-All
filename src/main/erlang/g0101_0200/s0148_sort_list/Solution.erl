% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Sorting #Two_Pointers #Linked_List
% #Divide_and_Conquer #Merge_Sort #Level_2_Day_4_Linked_List #Top_Interview_150_Divide_and_Conquer
% #Big_O_Time_O(log(N))_Space_O(log(N)) #2025_01_18_Time_43_ms_(100.00%)_Space_102.77_MB_(100.00%)

%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

%% @spec sort_list(Head :: #list_node{} | null) -> #list_node{} | null.
-spec sort_list(Head :: #list_node{} | null) -> #list_node{} | null.
sort_list(Head) ->
    List = node_to_list(Head, []),
    SortedList = lists:sort(fun(X, Y) -> X > Y end, List),
    list_to_node(SortedList, null).

%% Converts a linked list to an Erlang list.
-spec node_to_list(Node :: #list_node{} | null, Acc :: [integer()]) -> [integer()].
node_to_list(null, Acc) ->
    Acc;
node_to_list(#list_node{val = Val, next = Next}, Acc) ->
    node_to_list(Next, [Val | Acc]).

%% Converts an Erlang list to a linked list.
-spec list_to_node(List :: [integer()], Node :: #list_node{} | null) -> #list_node{} | null.
list_to_node([], Node) ->
    Node;
list_to_node([H | T], Node) ->
    list_to_node(T, #list_node{val = H, next = Node}).
