% #Medium #Top_100_Liked_Questions #Array #Hash_Table #Sorting #Heap_Priority_Queue #Counting
% #Divide_and_Conquer #Quickselect #Bucket_Sort #Data_Structure_II_Day_20_Heap_Priority_Queue
% #Big_O_Time_O(n*log(n))_Space_O(k) #2025_01_20_Time_12_(100.00%)_Space_80.46_(100.00%)

-spec top_k_frequent(Nums :: [integer()], K :: integer()) -> [integer()].
top_k_frequent(Nums, K) ->
    % Count frequencies using a map
    FreqMap = lists:foldl(
        fun(N, Map) ->
            maps:update_with(N, fun(V) -> V + 1 end, 1, Map)
        end,
        #{},
        Nums
    ),
    
    % Convert map to list, sort by frequency (descending), take K elements
    FreqList = maps:to_list(FreqMap),
    SortedList = lists:sort(
        fun({_, Count1}, {_, Count2}) -> Count1 > Count2 end,
        FreqList
    ),
    TopK = lists:sublist(SortedList, K),
    
    % Extract only the numbers from the result
    [Num || {Num, _Count} <- TopK].
