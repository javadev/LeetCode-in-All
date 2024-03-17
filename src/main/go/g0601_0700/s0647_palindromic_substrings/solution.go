package s0647_palindromic_substrings

// #Medium #Top_100_Liked_Questions #String #Dynamic_Programming #Big_O_Time_O(n^2)_Space_O(n)
// #2024_03_10_Time_0_ms_(100.00%)_Space_2.1_MB_(41.43%)

func expand(a []rune, l int, r int, res *int) {
	for l >= 0 && r < len(a) {
		if a[l] != a[r] {
			return
		} else {
			*res++
			l--
			r++
		}
	}
}

func countSubstrings(s string) int {
	a := []rune(s)
	res := 0
	for i := 0; i < len(a); i++ {
		expand(a, i, i, &res)
		expand(a, i, i+1, &res)
	}
	return res
}
