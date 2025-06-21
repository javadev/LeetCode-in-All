// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Heap_Priority_Queue
// #Divide_and_Conquer #Quickselect #LeetCode_75_Heap/Priority_Queue
// #Data_Structure_II_Day_20_Heap_Priority_Queue #Top_Interview_150_Heap
// #Big_O_Time_O(n*log(n))_Space_O(log(n)) #2024_10_08_Time_381_ms_(94.12%)_Space_166.6_MB_(88.24%)

class Solution {
  int findKthLargest(List<int> nums, int k) {
    int partition(int low, int high, int pivot) {
      for (; low <= high; low++, high--) {
        for (; nums[low] < pivot; low++);
        for (; nums[high] > pivot; high--);
        if (low > high) break;
        int temp = nums[low];
        nums[low] = nums[high];
        nums[high] = temp;
      }
      return low;
    }

    void quickSort(int low, int high) {
      if (low >= high) {
        return;
      }
      int pivot = nums[(low + high) ~/ 2];
      int index = partition(low, high, pivot);

      quickSort(low, index - 1);
      quickSort(index, high);
    }

    quickSort(0, nums.length - 1);

    return nums[nums.length - k];
  }
}
