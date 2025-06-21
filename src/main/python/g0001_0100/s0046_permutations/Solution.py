# #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Backtracking
# #Algorithm_I_Day_11_Recursion_Backtracking #Level_2_Day_20_Brute_Force/Backtracking
# #Udemy_Backtracking/Recursion #Top_Interview_150_Backtracking #Big_O_Time_O(n*n!)_Space_O(n+n!)
# #2024_06_08_Time_28_ms_(98.67%)_Space_16.6_MB_(93.71%)

class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        if not nums:
            return []
        
        final_result = []
        self.permute_recur(nums, final_result, [], [False] * len(nums))
        return final_result

    def permute_recur(self, nums: List[int], final_result: List[List[int]], curr_result: List[int], used: List[bool]):
        if len(curr_result) == len(nums):
            final_result.append(curr_result.copy())
            return
        
        for i in range(len(nums)):
            if used[i]:
                continue
            curr_result.append(nums[i])
            used[i] = True
            self.permute_recur(nums, final_result, curr_result, used)
            used[i] = False
            curr_result.pop()
