// #Medium #String #Top_Interview_150_Array/String
// #2024_09_30_Time_374_ms_(94.79%)_Space_150.8_MB_(57.29%)

class Solution {
  String convert(String s, int numRows) {
    int sLen = s.length;
    if (numRows == 1) {
      return s;
    }
    int maxDist = numRows * 2 - 2;
    StringBuffer buf = StringBuffer();

    for (int i = 0; i < numRows; i++) {
      int index = i;
      if (i == 0 || i == numRows - 1) {
        while (index < sLen) {
          buf.write(s[index]);
          index += maxDist;
        }
      } else {
        while (index < sLen) {
          buf.write(s[index]);
          index += maxDist - i * 2;
          if (index >= sLen) {
            break;
          }
          buf.write(s[index]);
          index += i * 2;
        }
      }
    }
    return buf.toString();
  }
}
