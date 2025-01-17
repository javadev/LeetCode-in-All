% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting
% #Data_Structure_II_Day_2_Array #Level_2_Day_17_Interval #Udemy_2D_Arrays/Matrix
% #Big_O_Time_O(n_log_n)_Space_O(n) #2025_01_13_Time_8_(100.00%)_Space_70.88_(100.00%)

-spec merge(Intervals :: [[integer()]]) -> [[integer()]].
merge(Intervals) ->
    SortedIntervals = lists:sort(fun([Start1, _], [Start2, _]) -> Start1 =< Start2 end, Intervals),
    lists:reverse(
        lists:foldl(fun([Start, Finish], Acc) ->
            case Acc of
                [] -> [[Start, Finish]];
                [[PrevStart, PrevFinish] | Rest] ->
                    if PrevFinish >= Start ->
                        %% Merge overlapping intervals
                        [[PrevStart, erlang:max(PrevFinish, Finish)] | Rest];
                       true ->
                        %% No overlap
                        [[Start, Finish] | Acc]
                    end
            end
        end, [], SortedIntervals)
    ).
