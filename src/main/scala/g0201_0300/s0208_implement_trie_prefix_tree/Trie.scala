package g0201_0300.s0208_implement_trie_prefix_tree

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Design #Trie
// #Level_2_Day_16_Design #Udemy_Trie_and_Heap
// #Big_O_Time_O(word.length())_or_O(prefix.length())_Space_O(N)
// #2023_11_05_Time_610_ms_(100.00%)_Space_67.5_MB_(64.00%)

class Trie() {
    private val root = new TrieNode
    private var startsWith = false

    private class TrieNode {
        val children = new Array[TrieNode](26)
        var isWord = false
    }

    def insert(word: String): Unit = {
        insert(word, root, 0)
    }

    private def insert(word: String, current: TrieNode, index: Int): Unit = {
        if (index == word.length) {
            current.isWord = true
            return
        }
        val charIndex = word.charAt(index) - 'a'
        if (current.children(charIndex) == null) {
            current.children(charIndex) = new TrieNode
        }
        insert(word, current.children(charIndex), index + 1)
    }

    def search(word: String): Boolean = {
        search(word, root, 0)
    }

    private def search(word: String, current: TrieNode, index: Int): Boolean = {
        if (index == word.length) {
            startsWith = true
            current.isWord
        } else {
            val charIndex = word.charAt(index) - 'a'
            if (current.children(charIndex) == null) {
                startsWith = false
                false
            } else {
                search(word, current.children(charIndex), index + 1)
            }
        }
    }

    def startsWith(prefix: String): Boolean = {
        search(prefix)
        startsWith
    }
}
