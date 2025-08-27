// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #String #Hash_Table #Sorting
// #Data_Structure_II_Day_8_String #Programming_Skills_II_Day_11 #Udemy_Strings
// #Top_Interview_150_Hashmap #Big_O_Time_O(n*k_log_k)_Space_O(n)
// #2024_06_23_Time_67_ms_(84.64%)_Space_18.6_MB_(43.89%)

public class Solution {
    public func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hm = [String: [String]]()
        for s in strs {
            let sortedStr = String(s.sorted())
            if hm[sortedStr] == nil {
                hm[sortedStr] = [String]()
            }
            hm[sortedStr]!.append(s)
        }
        return Array(hm.values)
    }
}
