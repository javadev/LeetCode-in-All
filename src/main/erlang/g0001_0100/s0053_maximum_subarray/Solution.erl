% #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
% #Divide_and_Conquer #Data_Structure_I_Day_1_Array #Dynamic_Programming_I_Day_5
% #Udemy_Famous_Algorithm #Top_Interview_150_Kadane's_Algorithm #Big_O_Time_O(n)_Space_O(1)
% #2025_01_12_Time_4_(100.00%)_Space_146.33_(_%)

-spec max_sub_array(Nums :: [integer()]) -> integer().
-export([dp/4]).
max_sub_array(Nums) ->
 N= length(Nums),
   [Sum|Send] = Nums,
 Max=Sum,
 dp(Send,N-1,Sum,Max).
     

dp(Nums,0,Sum,Max)->
   Max;
dp(Nums,N,Sum,Max) ->
   [A|B] = Nums,
   if 
       A+Sum > A -> Next = Sum+A;
       true -> Next = A
   end,
   if  
       Next>Max -> Max2 = Next;
       true -> Max2 = Max
   end,
   dp(B,N-1,Next,Max2).
