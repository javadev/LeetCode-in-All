% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Backtracking
% #Algorithm_II_Day_11_Recursion_Backtracking #Udemy_Backtracking/Recursion
% #Top_Interview_150_Backtracking #Big_O_Time_O(4^n)_Space_O(n)
% #2025_01_12_Time_0_(100.00%)_Space_58.43_(_%)

-spec letter_combinations(Digits :: unicode:unicode_binary()) -> [unicode:unicode_binary()].
letter_combinations(Digits) ->
    Res = lists:foldl(fun(Digit, Acc) -> 
        case Digit of
            <<"2">> -> 
                [<<Accbin/binary, Byte/binary>> || Byte <- [<<A>> || <<A:8>> <= <<"abc">>], Accbin <- Acc];
            <<"3">> -> 
                [<<Accbin/binary, Byte/binary>> || Byte <- [<<A>> || <<A:8>> <= <<"def">>], Accbin <- Acc];
            <<"4">> -> 
                [<<Accbin/binary, Byte/binary>> || Byte <- [<<A>> || <<A:8>> <= <<"ghi">>], Accbin <- Acc];
            <<"5">> -> 
                [<<Accbin/binary, Byte/binary>> || Byte <- [<<A>> || <<A:8>> <= <<"jkl">>], Accbin <- Acc];
            <<"6">> -> 
                [<<Accbin/binary, Byte/binary>> || Byte <- [<<A>> || <<A:8>> <= <<"mno">>], Accbin <- Acc];
            <<"7">> -> 
                [<<Accbin/binary, Byte/binary>> || Byte <- [<<A>> || <<A:8>> <= <<"pqrs">>], Accbin <- Acc];
            <<"8">> -> 
                [<<Accbin/binary, Byte/binary>> || Byte <- [<<A>> || <<A:8>> <= <<"tuv">>], Accbin <- Acc];
            <<"9">> -> 
                [<<Accbin/binary, Byte/binary>> || Byte <- [<<A>> || <<A:8>> <= <<"wxyz">>], Accbin <- Acc]
        end
    end, [<<>>], [<<B>> || <<B:8>> <= Digits]),
    case Res of
        [<<>>] -> [];
        _ -> Res
    end.
