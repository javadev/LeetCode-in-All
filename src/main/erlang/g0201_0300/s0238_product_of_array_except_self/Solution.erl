% #Medium #Top_100_Liked_Questions #Array #Prefix_Sum #Data_Structure_II_Day_5_Array #Udemy_Arrays
% #Top_Interview_150_Array/String #Big_O_Time_O(n^2)_Space_O(n)
% #2025_01_19_Time_22_(100.00%)_Space_112.22_(100.00%)

-spec product_except_self(Nums :: [integer()]) -> [integer()].
product_except_self(Nums) ->
    Forwards = product(Nums, [], 1),
    Backwards = lists:reverse(product(lists:reverse(Nums), [], 1)),
    except_self([1|Forwards], Backwards ++ [1], []).

product([], Res, _) -> lists:reverse(Res);
product([H|T], Res, Acc) ->
    P = H * Acc,
    product(T, [P|Res], P).

except_self([_], [_], Res) -> lists:reverse(Res);
except_self([F|T1], [_, B|T2], Res) ->
    except_self(T1, [B|T2], [F * B|Res]).
