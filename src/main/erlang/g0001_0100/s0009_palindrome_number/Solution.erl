% #Easy #Math #Udemy_Integers #Top_Interview_150_Math
% #2025_01_09_Time_1_(100.00%)_Space_58.73_(70.00%)

-spec is_palindrome(X :: integer()) -> boolean().
is_palindrome(X) when X < 0 ->
    false;
is_palindrome(X) ->
    Rev = reverse_number(X, 0),
    Rev == X.

-spec reverse_number(Num :: integer(), Rev :: integer()) -> integer().
reverse_number(0, Rev) ->
    Rev;
reverse_number(Num, Rev) ->
    Digit = Num rem 10,
    NewRev = Rev * 10 + Digit,
    reverse_number(Num div 10, NewRev).
