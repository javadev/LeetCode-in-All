% #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Breadth_First_Search
% #Algorithm_II_Day_18_Dynamic_Programming #Dynamic_Programming_I_Day_20
% #Level_2_Day_12_Dynamic_Programming #Big_O_Time_O(m*n)_Space_O(amount)
% #2025_01_20_Time_797_(100.00%)_Space_66.72_(100.00%)

-spec coin_change(Coins :: [integer()], Amount :: integer()) -> integer().
coin_change(Coins, Amount) ->
    % Sort coins in ascending order
    SortedCoins = lists:sort(Coins),
    
    % Initialize DP map with base case
    InitDP = #{0 => 0},
    
    % Build DP table for amounts from 1 to target
    case Amount of
        0 -> 0;
        _ ->
            FinalDP = build_dp_table(SortedCoins, lists:seq(1, Amount), InitDP),
            % Get result or return -1 if not possible
            maps:get(Amount, FinalDP, -1)
    end.

% Build DP table for all amounts
-spec build_dp_table([integer()], [integer()], map()) -> map().
build_dp_table(_Coins, [], DP) -> DP;
build_dp_table(Coins, [Amount|Rest], DP) ->
    NewDP = process_coins_for_amount(Coins, Amount, DP),
    build_dp_table(Coins, Rest, NewDP).

% Process all coins for current amount
-spec process_coins_for_amount([integer()], integer(), map()) -> map().
process_coins_for_amount([], _Amount, DP) -> DP;
process_coins_for_amount([Coin|Rest], Amount, DP) ->
    case Coin > Amount of
        true ->
            % Stop if coin is larger than current amount
            DP;
        false ->
            % Try using current coin
            case maps:get(Amount - Coin, DP, undefined) of
                undefined ->
                    % Can't use this coin, try next
                    process_coins_for_amount(Rest, Amount, DP);
                PrevCount ->
                    % Can use this coin, update minimum coins needed
                    NewCount = PrevCount + 1,
                    NewDP = maps:update_with(Amount, 
                                           fun(OldVal) -> min(OldVal, NewCount) end,
                                           NewCount, 
                                           DP),
                    process_coins_for_amount(Rest, Amount, NewDP)
            end
    end.
