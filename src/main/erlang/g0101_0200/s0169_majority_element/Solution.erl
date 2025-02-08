% #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Sorting #Counting
% #Divide_and_Conquer #Data_Structure_II_Day_1_Array #Udemy_Famous_Algorithm
% #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(1)
% #2025_01_18_Time_2_(100.00%)_Space_76.02_(100.00%)

-spec majority_element(Nums :: [integer()]) -> integer().
majority_element(Nums) ->
    element(1, lists:foldl(
        fun(Num, {Candi, Cnt}) -> 
            NewCandi = if Cnt == 0 -> Num; true -> Candi end,
            NewCnt = if NewCandi == Num -> Cnt + 1; true -> Cnt - 1 end,
            {NewCandi, NewCnt}
        end,
        {0, 0},
        Nums
    )).
