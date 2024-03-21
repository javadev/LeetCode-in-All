package s0239_sliding_window_maximum

// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Heap_Priority_Queue
// #Sliding_Window #Queue #Monotonic_Queue #Udemy_Arrays #Big_O_Time_O(n*k)_Space_O(n+k)
// #2024_03_18_Time_168_ms_(99.41%)_Space_9.3_MB_(64.37%)

func maxSlidingWindow(nums []int, k int) []int {
	if k == 1 {
		return nums
	}
	i := 1
	prev := nums
	var reuse []int
	for ; (1 << i) <= k; i++ {
		next := maxReduce(prev, 1<<(i-1), reuse)
		reuse = prev
		prev = next
	}
	if 1<<i == k {
		return prev
	}
	diff := k - (1 << (i - 1))
	return maxReduce(prev, diff, nil)[:len(nums)-k+1]
}

func maxReduce(nums []int, skip int, reuse []int) []int {
	// reuse allows to reuse prior allocations
	n := len(nums)
	var result []int
	if reuse != nil {
		result = reuse
	} else {
		result = make([]int, n-skip)
	}
	for i := 0; i < n-skip; i++ {
		result[i] = max(nums[i], nums[i+skip])
	}
	return result[:n-skip]
}
