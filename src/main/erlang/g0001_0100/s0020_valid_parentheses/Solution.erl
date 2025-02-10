% #Easy #Top_100_Liked_Questions #Top_Interview_Questions #String #Stack
% #Data_Structure_I_Day_9_Stack_Queue #Udemy_Strings #Top_Interview_150_Stack
% #Big_O_Time_O(n)_Space_O(n) #2025_01_11_Time_0_ms_(100.00%)_Space_60.53_MB_(_%)

%% Check if binary has valid parentheses
-spec is_valid(S :: unicode:unicode_binary()) -> boolean().
is_valid(S) ->
    process_binary(S, []).

%% Process binary with stack, where empty list is empty stack
-spec process_binary(binary(), list()) -> boolean().
process_binary(<<>>, []) -> 
    true;
process_binary(<<>>, _Stack) -> 
    false;
process_binary(<<Char/utf8, Rest/binary>>, Stack) ->
    case Char of
        40 -> process_binary(Rest, [40 | Stack]);  % '('
        91 -> process_binary(Rest, [91 | Stack]);  % '['
        123 -> process_binary(Rest, [123 | Stack]);  % '{'
        41 -> % ')'
            case Stack of
                [40 | NewStack] -> process_binary(Rest, NewStack);
                _ -> false
            end;
        93 -> % ']'
            case Stack of
                [91 | NewStack] -> process_binary(Rest, NewStack);
                _ -> false
            end;
        125 -> % '}'
            case Stack of
                [123 | NewStack] -> process_binary(Rest, NewStack);
                _ -> false
            end;
        _ -> false  % Invalid character
    end.
