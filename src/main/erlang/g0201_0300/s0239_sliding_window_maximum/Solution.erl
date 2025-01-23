% #Hard #Top_100_Liked_Questions #Array #Heap_Priority_Queue #Sliding_Window #Queue
% #Monotonic_Queue #Udemy_Arrays #Big_O_Time_O(n*k)_Space_O(n+k)
% #2025_01_19_Time_422_(100.00%)_Space_151.54_(100.00%)

-spec max_sliding_window(Nums :: [integer()], K :: integer()) -> [integer()].
max_sliding_window(Nums, K) ->
    {Results, _} = lists:mapfoldl(
        fun({X, I}, Q) ->
            Q2 = enqueue(Q, X, I),
            get_max(Q2, I - K)
        end,
        queue:new(),
        lists:zip(Nums, lists:seq(0, length(Nums)-1))
    ),
    lists:nthtail(K-1, Results).

-spec enqueue(queue:queue(), integer(), integer()) -> queue:queue().
enqueue(Q, X, I) ->
    case queue:peek_r(Q) of
        {value, {Y, _}} when Y =< X ->
            enqueue(queue:drop_r(Q), X, I);
        _ ->
            queue:in({X, I}, Q)
    end.

-spec get_max(queue:queue(), integer()) -> {integer(), queue:queue()}.
get_max(Q, DropUntil) ->
    case queue:peek(Q) of
        {value, {_, J}} when J =< DropUntil ->
            get_max(queue:drop(Q), DropUntil);
        {value, {Y, _}} ->
            {Y, Q}
    end.
