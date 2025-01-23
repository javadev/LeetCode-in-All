% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Hash_Table #Design #Linked_List
% #Doubly_Linked_List #Udemy_Linked_List #Big_O_Time_O(1)_Space_O(capacity)
% #2025_01_18_Time_312_(100.00%)_Space_273.78_(100.00%)

%% Persistent Term Keys
-define(CAPACITY_KEY, {lru_cache, capacity}).
-define(CACHE_TABLE, lru_cache_cache_table).
-define(TTL_TABLE, lru_cache_ttl_table).

%% API Specifications
-spec lru_cache_init_(Capacity :: integer()) -> ok.
lru_cache_init_(Capacity) ->
    persistent_term:put(?CAPACITY_KEY, Capacity),
    case ets:info(?CACHE_TABLE) of
        undefined ->
            ets:new(?CACHE_TABLE, [set, public, named_table]),
            ets:new(?TTL_TABLE, [ordered_set, public, named_table]);
        _ ->
            ets:delete_all_objects(?CACHE_TABLE),
            ets:delete_all_objects(?TTL_TABLE)
    end,
    ok.

-spec lru_cache_get(Key :: integer()) -> integer().
lru_cache_get(Key) ->
    case extract(Key) of
        {Key, Value} ->
            insert(Key, Value),
            Value;
        -1 ->
            -1
    end.

-spec lru_cache_put(Key :: integer(), Value :: integer()) -> ok.
lru_cache_put(Key, Value) ->
    _ = extract(Key),
    insert(Key, Value),
    evict(),
    ok.

%% Internal Functions
extract(Key) ->
    case ets:lookup(?CACHE_TABLE, Key) of
        [{Key, Uniq, Value}] ->
            ets:delete(?TTL_TABLE, Uniq),
            {Key, Value};
        [] ->
            -1
    end.

insert(Key, Value) ->
    Uniq = unique_integer(),
    ets:insert(?CACHE_TABLE, {Key, Uniq, Value}),
    ets:insert(?TTL_TABLE, {Uniq, Key}).

evict() ->
    Capacity = persistent_term:get(?CAPACITY_KEY),
    CurrentSize = ets:info(?CACHE_TABLE, size),
    if
        CurrentSize > Capacity ->
            Uniq = ets:first(?TTL_TABLE),
            [{_, Key}] = ets:lookup(?TTL_TABLE, Uniq),
            ets:delete(?TTL_TABLE, Uniq),
            ets:delete(?CACHE_TABLE, Key);
        true ->
            ok
    end.

unique_integer() ->
    erlang:unique_integer([monotonic]).

%% Your functions will be called as such:
%% lru_cache_init_(Capacity),
%% Param_1 = lru_cache_get(Key),
%% lru_cache_put(Key, Value),

%% lru_cache_init_ will be called before every test case, in which you can do some necessary initializations.
