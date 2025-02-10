% #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Bit_Manipulation
% #Data_Structure_II_Day_1_Array #Algorithm_I_Day_14_Bit_Manipulation #Udemy_Integers
% #Top_Interview_150_Bit_Manipulation #Big_O_Time_O(N)_Space_O(1)
% #2025_01_16_Time_0_ms_(100.00%)_Space_72.99_MB_(100.00%)

-spec single_number(Nums :: [integer()]) -> integer().
single_number(Nums) ->
    %% using lists:foldl to calculate the xor of all elements in the list
    lists:foldl(fun(X, Acc) -> X bxor Acc end, 0, Nums).
