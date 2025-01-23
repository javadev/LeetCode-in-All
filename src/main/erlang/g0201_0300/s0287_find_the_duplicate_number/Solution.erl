% #Medium #Top_100_Liked_Questions #Array #Binary_Search #Two_Pointers #Bit_Manipulation
% #Binary_Search_II_Day_5 #Big_O_Time_O(n)_Space_O(n)
% #2025_01_19_Time_234_(100.00%)_Space_156.27_(100.00%)

-spec find_duplicate(Nums :: [integer()]) -> integer().
find_duplicate(Nums) ->
    [Head | _] = lists:subtract(Nums, lists:usort(Nums)),
    Head.
