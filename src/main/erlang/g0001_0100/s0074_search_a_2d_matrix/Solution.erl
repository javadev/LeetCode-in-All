% #Medium #Top_100_Liked_Questions #Array #Binary_Search #Matrix #Data_Structure_I_Day_5_Array
% #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_8 #Level_2_Day_8_Binary_Search
% #Udemy_2D_Arrays/Matrix #Top_Interview_150_Binary_Search #Big_O_Time_O(endRow+endCol)_Space_O(1)
% #2025_01_13_Time_0_ms_(100.00%)_Space_61.38_MB_(100.00%)

-spec search_matrix(Matrix :: [[integer()]], Target :: integer()) -> boolean().
search_matrix(Matrix, Target) -> 
    % Get the total number of rows and columns
    {Rows, Cols} = {length(Matrix), length(hd(Matrix))},
    
    % Perform binary search
    binary_search(Matrix, Rows, Cols, Target, 0, Rows * Cols - 1).

% Function to perform binary search
-spec binary_search([[integer()]], integer(), integer(), integer(), integer(), integer()) -> boolean().
binary_search(Matrix, Rows, Cols, Target, Left, Right) ->
    if 
        Left > Right -> 
            false; % If left index exceeds the right one, return false
        true ->
            % Calculate mid index and get corresponding row and column
            Mid = (Left + Right) div 2,
            {Row, Col} = {Mid div Cols, Mid rem Cols},
            
            % Fetch the value from the matrix
            Value = lists:nth(Col + 1, lists:nth(Row + 1, Matrix)),
            
            % If the value equals the target, return true
            if
                Value == Target -> 
                    true;
                Value < Target -> 
                    % If the value is less than the target, search in the right half
                    binary_search(Matrix, Rows, Cols, Target, Mid + 1, Right);
                true -> 
                    % If the value is greater than the target, search in the left half
                    binary_search(Matrix, Rows, Cols, Target, Left, Mid - 1)
            end
    end.
