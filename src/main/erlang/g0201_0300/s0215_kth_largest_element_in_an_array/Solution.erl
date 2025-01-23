% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Heap_Priority_Queue
% #Divide_and_Conquer #Quickselect #Data_Structure_II_Day_20_Heap_Priority_Queue
% #Big_O_Time_O(n*log(n))_Space_O(log(n)) #2025_01_19_Time_803_(100.00%)_Space_147.74_(100.00%)

-spec find_kth_largest(Nums :: [integer()], K :: integer()) -> integer().
find_kth_largest(Nums, K) ->
    Q = gb_sets:new(),
    FinalQ = lists:foldl(fun({N, I}, AccQ) ->
        case gb_sets:is_element({N, I}, AccQ) of
            true -> AccQ;
            false ->
                case gb_sets:size(AccQ) < K of
                    true ->
                        gb_sets:insert({N, I}, AccQ);
                    false ->
                        {Smallest, TempQ} = gb_sets:take_smallest(AccQ),
                        gb_sets:insert(max(Smallest, {N, I}), TempQ)
                end
        end
    end, Q, lists:zip(Nums, lists:seq(1, length(Nums)))),
    element(1, gb_sets:smallest(FinalQ)).

% Helper function to find the maximum of two tuples based on their first element.
max({N1, I1}, {N2, I2}) when N1 >= N2 -> {N1, I1};
max(_, {N2, I2}) -> {N2, I2}.
