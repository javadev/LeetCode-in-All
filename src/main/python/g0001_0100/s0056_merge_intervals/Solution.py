# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting
# #Data_Structure_II_Day_2_Array #Level_2_Day_17_Interval #Udemy_2D_Arrays/Matrix
# #Top_Interview_150_Intervals #Big_O_Time_O(n_log_n)_Space_O(n)
# #2024_06_08_Time_109_ms_(98.07%)_Space_20.5_MB_(84.05%)

class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort(key=lambda x: x[0])
        merged = []
        for interval in intervals:
            if not merged or merged[-1][1] < interval[0]:
                merged.append(interval)
            else:
                merged[-1][1] = max(merged[-1][1], interval[1])
        return merged
