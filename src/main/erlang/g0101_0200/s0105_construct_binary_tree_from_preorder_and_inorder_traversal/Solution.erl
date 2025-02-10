% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Tree #Binary_Tree
% #Divide_and_Conquer #Data_Structure_II_Day_15_Tree #Top_Interview_150_Binary_Tree_General
% #Big_O_Time_O(N)_Space_O(N) #2025_01_15_Time_169_ms_(100.00%)_Space_66.76_MB_(100.00%)

%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec build_tree(Preorder :: [integer()], Inorder :: [integer()]) -> #tree_node{} | null.
build_tree([], []) ->
    null;
build_tree([Head | Preorder], Inorder) ->
    {LeftInorder, [_ | RightInorder]} = split_while(fun(X) -> X =/= Head end, Inorder),
    {LeftPreorder, RightPreorder} = take_and_drop(Preorder, length(LeftInorder)),
    #tree_node{
        val = Head,
        left = build_tree(LeftPreorder, LeftInorder),
        right = build_tree(RightPreorder, RightInorder)
    }.

-spec take_and_drop(List :: [integer()], N :: integer()) -> {[integer()], [integer()]}.
take_and_drop(List, N) ->
    take_and_drop(List, N, []).

-spec take_and_drop(List :: [integer()], N :: integer(), Acc :: [integer()]) -> {[integer()], [integer()]}.
take_and_drop(List, 0, Acc) ->
    {lists:reverse(Acc), List};
take_and_drop([Head | Tail], N, Acc) ->
    take_and_drop(Tail, N - 1, [Head | Acc]).

-spec split_while(Fun :: fun((integer()) -> boolean()), List :: [integer()]) -> {[integer()], [integer()]}.
split_while(_, []) ->
    {[], []};
split_while(Fun, [H | T]) ->
    case Fun(H) of
        true ->
            {Left, Right} = split_while(Fun, T),
            {[H | Left], Right};
        false ->
            {[], [H | T]}
    end.
