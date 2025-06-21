// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting
// #Data_Structure_II_Day_2_Array #Level_2_Day_17_Interval #Udemy_2D_Arrays/Matrix
// #Top_Interview_150_Intervals #Big_O_Time_O(n_log_n)_Space_O(n)
// #2024_10_05_Time_376_ms_(100.00%)_Space_161.1_MB_(8.16%)

class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    // Sort the intervals based on the start time
    intervals.sort((a, b) =>a[0].compareTo(b[0]));

    List<List<int>> merged = [];
    List<int> current = intervals[0];
    merged.add(current);

    for (List<int> next in intervals){
      if (current[1] >= next[0]) {
        // If the intervals overlap, merge them
        current[1] = current[1] > next[1] ? current[1] : next[1];
      } else {
        // Otherwise, move to the next interval
        current = next;
        merged.add(current);
      }
    }

    return merged;
  }
}
