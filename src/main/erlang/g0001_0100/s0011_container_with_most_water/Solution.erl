% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Greedy #Two_Pointers
% #Algorithm_II_Day_4_Two_Pointers #Top_Interview_150_Two_Pointers #Big_O_Time_O(n)_Space_O(1)
% #2025_01_09_Time_13_(100.00%)_Space_123.05_(100.00%)

-spec max_area([integer()]) -> integer().
max_area(Height) ->
    TupleHeight = list_to_tuple(Height),
    max_area(TupleHeight, 0, length(Height) - 1, 0).

max_area(_, Left, Right, MaxArea) when Left >= Right ->
    MaxArea;
max_area(TupleHeight, Left, Right, MaxArea) ->
    LeftHeight = element(Left + 1, TupleHeight),
    RightHeight = element(Right + 1, TupleHeight),
    Width = Right - Left,
    CurrentArea = min(LeftHeight, RightHeight) * Width,
    NewMaxArea = max(MaxArea, CurrentArea),
    
    % Move the pointer pointing to the shorter line
    case LeftHeight < RightHeight of
        true  -> max_area(TupleHeight, Left + 1, Right, NewMaxArea);
        false -> max_area(TupleHeight, Left, Right - 1, NewMaxArea)
    end.
