% #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Binary_Search_Tree
% #Data_Structure_II_Day_17_Tree #Level_2_Day_9_Binary_Search_Tree #Big_O_Time_O(n)_Space_O(n)
% #2025_01_19_Time_0_(100.00%)_Space_76.55_(100.00%)

%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

% Main function to find kth smallest element
-spec kth_smallest(Root :: #tree_node{} | null, K :: integer()) -> integer().
kth_smallest(Root, K) ->
    {_, Value} = find_kth_smallest(Root, K, 0),
    Value.

% Helper function to traverse the tree and find kth smallest
-spec find_kth_smallest(Node :: #tree_node{} | null, K :: integer(), Count :: integer()) -> 
    {integer(), integer() | null}.
find_kth_smallest(null, _, Count) ->
    {Count, null};
find_kth_smallest(Node, K, Count) ->
    % Search left subtree
    {NewCount, LeftValue} = find_kth_smallest(Node#tree_node.left, K, Count),
    
    % If we found the value in left subtree, return it
    case LeftValue of
        null ->
            % Increment count for current node
            CurrentCount = NewCount + 1,
            
            % Check if current node is the kth smallest
            case CurrentCount =:= K of
                true ->
                    {CurrentCount, Node#tree_node.val};
                false ->
                    % Search right subtree
                    find_kth_smallest(Node#tree_node.right, K, CurrentCount)
            end;
        _ ->
            {NewCount, LeftValue}
    end.
