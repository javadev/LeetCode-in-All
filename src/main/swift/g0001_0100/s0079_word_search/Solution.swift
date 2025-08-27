// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Matrix #Backtracking
// #Algorithm_II_Day_11_Recursion_Backtracking #Top_Interview_150_Backtracking
// #Big_O_Time_O(4^(m*n))_Space_O(m*n) #2024_06_24_Time_162_ms_(96.28%)_Space_16.3_MB_(46.10%)

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        var word = Array(word)

        var beginnings = [(Int, Int)]()

        for r in 0..<board.count{
            for c in 0..<board[0].count{
                if board[r][c] == word[0]{
                    beginnings.append((r, c))
                }
            }
        }

        var has = false
        for tup in beginnings{
            if word.count == 1{
                has = true
                break
            }

            var visitedBoard = [[Bool]](repeating:[Bool](repeating:false, count:board[0].count), count:board.count)
            visitedBoard[tup.0][tup.1] = true

            if proceed(tup, board, &visitedBoard, 1, word){
                has = true
                break
            }

        }

        return has

    }


    func proceed(_ startP:(Int, Int), _ board: [[Character]], _ visitedBoard:inout[[Bool]], _ targetIndex:Int, _ word:[Character]) -> Bool{

        let (r, c) = startP
        let rows = visitedBoard.count
        let cols = visitedBoard[0].count
        //try four directions
        //up
        var has = false
        if r - 1 >= 0{
            if visitedBoard[r-1][c] == false{
                if board[r-1][c] == word[targetIndex]{

                    if ((targetIndex + 1) == word.count){
                        return true
                    }

                    visitedBoard[r-1][c] = true
                    let tup = (r-1, c)
                    let res = proceed(tup, board, &visitedBoard, targetIndex+1, word)
                    visitedBoard[r-1][c] = false
                    if res == true{
                        return true
                    }
                }
            }
        }

        //left
        if c - 1 >= 0{
            if visitedBoard[r][c-1] == false{
                if board[r][c-1] == word[targetIndex]{

                    if ((targetIndex + 1) == word.count){
                        return true
                    }

                    visitedBoard[r][c-1] = true
                    let tup = (r, c-1)
                    let res = proceed(tup, board, &visitedBoard, targetIndex+1, word)
                    visitedBoard[r][c-1] = false
                    if res == true{
                        return true
                    }
                }
            }
        }

        //down
        if r + 1 < rows{
            if visitedBoard[r+1][c] == false{
                if board[r+1][c] == word[targetIndex]{

                    if ((targetIndex + 1) == word.count){
                        return true
                    }

                    visitedBoard[r+1][c] = true
                    let tup = (r+1, c)
                    let res = proceed(tup, board, &visitedBoard, targetIndex+1, word)
                    visitedBoard[r+1][c] = false
                    if res == true{
                        return true
                    }
                }
            }
        }

        //right
        if c + 1 < cols{
            if visitedBoard[r][c+1] == false{
                if board[r][c+1] == word[targetIndex]{

                    if ((targetIndex + 1) == word.count){
                        return true
                    }

                    visitedBoard[r][c+1] = true
                    let tup = (r, c+1)
                    let res = proceed(tup, board, &visitedBoard, targetIndex+1, word)
                    visitedBoard[r][c+1] = false
                    if res == true{
                        return true
                    }
                }
            }
        }

        return false
    }
}
