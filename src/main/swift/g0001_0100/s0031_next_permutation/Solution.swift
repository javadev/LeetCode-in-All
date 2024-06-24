// #Medium #Top_100_Liked_Questions #Array #Two_Pointers #Big_O_Time_O(n)_Space_O(1)
// #2024_06_19_Time_5_ms_(92.18%)_Space_16_MB_(31.84%)

class Solution {
    func swap(_ arr: inout [Int], _ i: Int, _ j: Int) {
            var temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
    }

    func nextPermutation(_ nums: inout [Int]) {
        var n = nums.count
        var i = n - 2
        while i >= 0 && nums[i] >= nums[i+1] {
            i -= 1
        }
        if i >= 0 {
            var k = n - 1
            while k > i {
                if nums[i] < nums[k] {
                    break
                }
                k -= 1
            }
            swap(&nums,i,k)

            for j in i+1..<n-1 {
                for k in j..<n {
                    if nums[j] > nums[k] {
                        swap(&nums,j,k)
                    }
                }
            }
        } else if n == 2 {
            swap(&nums,0,1)
        } else {
            nums = nums.sorted(by: { $0 < $1 })
        }
    }
}
