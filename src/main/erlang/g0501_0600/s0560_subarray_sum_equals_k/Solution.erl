% #Medium #Top_100_Liked_Questions #Array #Hash_Table #Prefix_Sum #Data_Structure_II_Day_5_Array
% #Big_O_Time_O(n)_Space_O(n) #2025_01_08_Time_47_(100.00%)_Space_79.35_(_%)

-spec subarray_sum(Nums :: [integer()], K :: integer()) -> integer().
subarray_sum(Nums, K) ->
    subarray_sum(Nums, K, 0, 0, #{0 => 1}).

-spec subarray_sum([integer()], integer(), integer(), integer(), #{integer() => integer()}) -> integer().
subarray_sum([], _K, _TempSum, Ret, _SumCount) -> 
    Ret;
subarray_sum([Num | Rest], K, TempSum, Ret, SumCount) ->
    NewTempSum = TempSum + Num,
    Count = maps:get(NewTempSum - K, SumCount, 0),
    NewRet = Ret + Count,
    UpdatedCount = maps:get(NewTempSum, SumCount, 0) + 1,
    NewSumCount = maps:put(NewTempSum, UpdatedCount, SumCount),
    subarray_sum(Rest, K, NewTempSum, NewRet, NewSumCount).
