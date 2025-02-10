% #Medium #Top_Interview_Questions #Math #Udemy_Integers
% #2025_01_08_Time_244_ms_(100.00%)_Space_58.56_MB_(100.00%)

-spec reverse(X :: integer()) -> integer().
reverse(X) -> reverse(X, 0).
reverse(0, Work) ->
  case abs(Work) > 2147483647 of
    true -> reverse(0,0);
    false -> Work
  end;
reverse(X, Work) -> reverse(trunc(X/10), (Work*10) + X rem 10).
