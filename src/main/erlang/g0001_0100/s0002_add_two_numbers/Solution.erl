% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Math #Linked_List #Recursion
% #Data_Structure_II_Day_10_Linked_List #Programming_Skills_II_Day_15
% #Top_Interview_150_Linked_List #Big_O_Time_O(max(N,M))_Space_O(max(N,M))
% #AI_can_be_used_to_solve_the_task #2025_01_05_Time_1_ms_(77.78%)_Space_63.11_MB_(100.00%)

%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec add_two_numbers(L1 :: #list_node{} | null, L2 :: #list_node{} | null) -> #list_node{} | null.
add_two_numbers(L1, L2) ->
    {Result, _} = add_two_numbers(L1, L2, 0),
    Result.

-spec add_two_numbers(L1 :: #list_node{} | null, L2 :: #list_node{} | null, Carry :: integer()) -> {#list_node{} | null, integer()}.
add_two_numbers(null, null, 0) -> 
    {null, 0};
add_two_numbers(L1, L2, Carry) ->
    X = if L1 =/= null -> L1#list_node.val; true -> 0 end,
    Y = if L2 =/= null -> L2#list_node.val; true -> 0 end,
    Sum = Carry + X + Y,
    NewCarry = Sum div 10,
    NewNode = #list_node{val = Sum rem 10},
    {Next1, _} = if L1 =/= null -> {L1#list_node.next, 0}; true -> {null, 0} end,
    {Next2, _} = if L2 =/= null -> {L2#list_node.next, 0}; true -> {null, 0} end,
    {NextResult, _} = add_two_numbers(Next1, Next2, NewCarry),
    {NewNode#list_node{next = NextResult}, NewCarry}.
