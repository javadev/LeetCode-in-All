% #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming #Two_Pointers
% #Stack #Monotonic_Stack #Dynamic_Programming_I_Day_9 #Udemy_Two_Pointers
% #Big_O_Time_O(n)_Space_O(1) #2025_01_12_Time_2_(100.00%)_Space_76.42_(100.00%)

-spec trap(Height :: [integer()]) -> integer().
trap(Height) ->
    N = length(Height),
    {_Max_val, Max_idx} = max_height(Height),
    First_half = sub_array(Height, Max_idx),
    Second_half = sub_array(lists:reverse(Height), N - Max_idx - 1),
    Result = process_heights(First_half) + process_heights(Second_half),
    Result.
    %%reverse_array(Height).


process_heights(List) ->
    process_heights(List, 0, 0).

process_heights([], _Cur_max, Result) ->
    Result;
process_heights([Head | Rest], Cur_max, Cur_res) when Head > Cur_max ->
    process_heights(Rest, Head, Cur_res);
process_heights([Head | Rest], Cur_max, Cur_res) ->
    New_res = Cur_res + Cur_max - Head,
    process_heights(Rest, Cur_max, New_res).


max_height([Head | Rest]) ->
    max_height(Rest, {Head, 0}, 1).

max_height([Head | Rest], {Cur_max, _Idx}, Idx) when Head > Cur_max ->
    max_height(Rest, {Head, Idx}, Idx + 1);
max_height([_Head | Rest], Cur_max, Idx) ->
    max_height(Rest, Cur_max, Idx + 1);
max_height([], Max_Set, _Idx) ->
    Max_Set.


sub_array(List, Left) ->
    sub_array(List, Left, []).

sub_array(_List, Left, Sub_array) when Left == 0 ->
    lists:reverse(Sub_array);
sub_array([Head | Rest], Left, Cur_array) ->
    sub_array(Rest, Left - 1, [Head | Cur_array]).
