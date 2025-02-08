% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Stack #Design
% #Data_Structure_II_Day_14_Stack_Queue #Programming_Skills_II_Day_18 #Level_2_Day_16_Design
% #Udemy_Design #Top_Interview_150_Stack #Big_O_Time_O(1)_Space_O(N)
% #2025_01_18_Time_16_(100.00%)_Space_78.65_(100.00%)

-spec min_stack_init_() -> any().
min_stack_init_() ->
    catch ets:delete(min_stack),
    ets:new(min_stack, [named_table, ordered_set, public]),
    ets:insert(min_stack, {size, 0}),
    ok.

-spec min_stack_push(Val :: integer()) -> any().
min_stack_push(Val) ->
    [{size, Size}] = ets:lookup(min_stack, size),
    CurrentMin = case Size of
        0 -> Val;
        _ -> min(Val, min_stack_get_min())
    end,
    ets:insert(min_stack, {Size + 1, {Val, CurrentMin}}),
    ets:insert(min_stack, {size, Size + 1}),
    ok.

-spec min_stack_pop() -> any().
min_stack_pop() ->
    [{size, Size}] = ets:lookup(min_stack, size),
    case Size > 0 of
        true ->
            ets:delete(min_stack, Size),
            ets:insert(min_stack, {size, Size - 1}),
            ok;
        false ->
            ok
    end.

-spec min_stack_top() -> integer().
min_stack_top() ->
    [{size, Size}] = ets:lookup(min_stack, size),
    case Size > 0 of
        true ->
            [{_, {Val, _}}] = ets:lookup(min_stack, Size),
            Val;
        false ->
            0  % Default value for empty stack
    end.

-spec min_stack_get_min() -> integer().
min_stack_get_min() ->
    [{size, Size}] = ets:lookup(min_stack, size),
    case Size > 0 of
        true ->
            [{_, {_, Min}}] = ets:lookup(min_stack, Size),
            Min;
        false ->
            0  % Default value for empty stack
    end.
