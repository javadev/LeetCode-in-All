// #Easy #Math #Udemy_Integers #Top_Interview_150_Math
// #2024_09_30_Time_518_ms_(95.59%)_Space_149.5_MB_(93.56%)

class Solution {
  bool isPalindrome(int x) {
    if (x < 0) {
      return false;
    }
    int temp = x;
    int rev = 0;
    while (temp != 0) {
      rev = temp % 10 + rev * 10;
      temp ~/= 10;
    }
    return x == rev;
  }
}
