% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Two_Pointers
% #Data_Structure_II_Day_1_Array #Algorithm_II_Day_3_Two_Pointers #Udemy_Two_Pointers
% #Top_Interview_150_Two_Pointers #Big_O_Time_O(n*log(n))_Space_O(n^2)
% #2025_01_09_Time_1387_(100.00%)_Space_527.05_(_%)

-spec three_sum(Nums :: [integer()]) -> [[integer()]].

three_sum(Nums) ->
    NumsSet     = sets:from_list(Nums),

    GroupedNums = maps:groups_from_list(fun(N)->if N>0->1; N<0->-1; true->0 end end, Nums),
    Negatives   = maps:get(-1, GroupedNums, []),
    Zeroes      = maps:get( 0, GroupedNums, []),
    Positives   = maps:get( 1, GroupedNums, []),
    NumZeroes   = length(Zeroes),

    {UniquePositive, UniquePositivePairs} = unique_pairs(Positives),
    {             _, UniqueNegativePairs} = unique_pairs(Negatives),

    SameSign     =  UniquePositivePairs ++ UniqueNegativePairs,

    NonZeroTriplets = [[A,B,-A-B] || {A,B} <- SameSign, sets:is_element(-A-B,NumsSet)],
    OneZeroTriplets =
        if NumZeroes>0 -> [[A,-A,0] || A <- UniquePositive, sets:is_element(-A,NumsSet)];
           true -> []
        end,
    ZeroTriplets = if NumZeroes>2 -> [[0,0,0]]; true-> [] end,
    NonZeroTriplets ++ OneZeroTriplets ++ ZeroTriplets.

unique_pairs(Nums) ->
    NumGroups    = maps:groups_from_list(fun(N)->N end, Nums),
    UniqueNums   = maps:keys(NumGroups),
    RepeatedNums = [{N,N} || N<-UniqueNums, length(maps:get(N,NumGroups))>1],
    {UniqueNums, pairs(UniqueNums,[]) ++ RepeatedNums}.

pairs([],Acc) -> lists:append(Acc);
pairs([H|T],Acc) -> pairs(T, [[{H,X}||X<-T]|Acc]).
