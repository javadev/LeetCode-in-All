// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
// #Backtracking #Big_O_Time_O(N*2^N)_Space_O(2^N*N)
// #2024_06_27_Time_454_ms_(98.01%)_Space_37.7_MB_(5.11%)

class Solution {
    func partition(_ s: String) -> [[String]] {
        var dict:[Int:[[String]]] = [:]
        var newStr = Array(s)
        dict[-1] = [[]]
        for i in 0..<newStr.count{
            var strArrs = [[String]]()
            for length in 1...i+1 {
                let candidate = String(newStr[(i+1-length)...i])
                if checkPalind(candidate){

                    for arr in dict[i-length]!{
                        var newArr = arr
                        newArr.append(candidate)
                        strArrs.append(newArr)
                    }

                }
            }

            dict[i] = strArrs
        }
        return dict[s.count-1]!
    }

    func checkPalind(_ str:String)->Bool{
        let strArr = Array(str)
        var valid = true
        var l = 0
        var r = strArr.count - 1
        while(l<=r){
            if strArr[l] == strArr[r]{
                l += 1
                r -= 1
            }else{
                valid = false
                break
            }
        }
        return valid
    }
}
