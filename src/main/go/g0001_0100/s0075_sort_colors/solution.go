package s0075_sort_colors

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Two_Pointers
// #Data_Structure_II_Day_2_Array #Udemy_Arrays #Big_O_Time_O(n)_Space_O(1)
// #2024_03_15_Time_1_ms_(76.26%)_Space_2.1_MB_(8.79%)

func sortColors(nums []int) {
	zeroes := 0
	ones := 0
	for i := range nums {
		if nums[i] == 0 {
			nums[zeroes], zeroes = 0, zeroes+1
		} else if nums[i] == 1 {
			ones++
		}
	}
	for j := zeroes; j < zeroes+ones; j++ {
		nums[j] = 1
	}
	for k := zeroes + ones; k < len(nums); k++ {
		nums[k] = 2
	}
}
