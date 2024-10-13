// #Medium #Top_100_Liked_Questions #Array #Hash_Table #Sorting #Heap_Priority_Queue #Counting
// #Divide_and_Conquer #Quickselect #Bucket_Sort #Data_Structure_II_Day_20_Heap_Priority_Queue
// #Big_O_Time_O(n*log(n))_Space_O(k) #2024_10_12_Time_337_ms_(97.50%)_Space_157.8_MB_(51.25%)

class Solution {
  List<int> topKFrequent(List<int> nums, int k) {
    Map<int, int> freq = {} ;
    int n = nums.length ;
    for(int i in nums)freq[i]=(freq[i] ?? 0) + 1;
    List<List<int>> cont=
            List.generate(n+1, (i) => [], growable: false);
    freq.forEach((k, v) => cont[v].add(k));
    List<int> res=[];

    for(int i=n; i>0; i--)
      if(cont[i]!= null)
        for(int j in cont[i]){
      res.add(j);
      k--;
      if(k ==0)return res;
    }
    return res;
  }
}
