% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
% #Backtracking #Algorithm_II_Day_11_Recursion_Backtracking #Udemy_Backtracking/Recursion
% #Big_O_Time_O(2^n)_Space_O(n) #2025_01_11_Time_0_(100.00%)_Space_58.84_(100.00%)

%% Generate all valid parenthesis combinations
-spec generate_parenthesis(N :: integer()) -> [unicode:unicode_binary()].
generate_parenthesis(N) ->
    generate(N, N, [], []).

%% Helper function that builds combinations recursively
-spec generate(Open :: integer(), Close :: integer(), 
              Current :: list(), Acc :: [unicode:unicode_binary()]) -> [unicode:unicode_binary()].
generate(0, 0, Current, Acc) ->
    % Convert the reversed list of characters to a binary
    [list_to_binary(lists:reverse(Current)) | Acc];
generate(Open, Close, Current, Acc) when Open > 0 ->
    % Try adding an opening parenthesis
    NewAcc1 = generate(Open - 1, Close, [$( | Current], Acc),
    % If we can add a closing parenthesis, try that branch too
    case Close > Open of
        true -> generate(Open, Close - 1, [$) | Current], NewAcc1);
        false -> NewAcc1
    end;
generate(Open, Close, Current, Acc) when Close > Open ->
    % Can only add a closing parenthesis
    generate(Open, Close - 1, [$) | Current], Acc).
