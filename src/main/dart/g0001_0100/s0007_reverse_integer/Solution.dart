// #Medium #Top_Interview_Questions #Math #Udemy_Integers
// #2024_10_03_Time_347_ms_(96.43%)_Space_153.6_MB_(5.61%)

class Solution {
  int reverse(int x) {
    int number = x.abs();
    int reverseNumber = 0;
    final int maxValue = 0x7fffffff;
    while (number != 0) {
      reverseNumber = reverseNumber * 10 + number % 10;
      number = number ~/ 10;
    }
    if (reverseNumber > maxValue) {
      return 0;
    }
    return x > 0 ? reverseNumber : -reverseNumber;
  }
}
