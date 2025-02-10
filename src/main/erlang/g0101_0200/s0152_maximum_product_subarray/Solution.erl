% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
% #Dynamic_Programming_I_Day_6 #Level_2_Day_13_Dynamic_Programming #Udemy_Dynamic_Programming
% #Big_O_Time_O(N)_Space_O(1) #2025_01_18_Time_0_ms_(100.00%)_Space_63.79_MB_(100.00%)

-spec max_product(Nums :: [integer()]) -> integer().
max_product(Nums) ->
    max_product(Nums, 1, 1, -(1 bsl 31)).

-spec max_product(Nums :: [integer()], integer(), integer(), integer()) -> integer().
max_product([], _, _, MaxProduct) ->
    MaxProduct;
max_product([H|T], MaxCurrent, MinCurrent, MaxProduct) ->
    % The new maximum and minimum products are derived by comparing
    % the current number, its product with the maximum so far, and its product with the minimum so far
    NewMaxCurrent = max(max(H, H * MaxCurrent), H * MinCurrent),
    NewMinCurrent = min(min(H, H * MaxCurrent), H * MinCurrent),
    NewMaxProduct = max(MaxProduct, NewMaxCurrent),
    max_product(T, NewMaxCurrent, NewMinCurrent, NewMaxProduct).
