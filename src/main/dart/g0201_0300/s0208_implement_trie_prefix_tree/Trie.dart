// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Design #Trie
// #Level_2_Day_16_Design #Udemy_Trie_and_Heap
// #Big_O_Time_O(word.length())_or_O(prefix.length())_Space_O(N)
// #2024_10_08_Time_408_ms_(93.55%)_Space_188.9_MB_(77.42%)

class Trie {
  TrieNode root;
  bool startWith = false;

  Trie() : root = TrieNode();

  // Inserts a word into the trie.
  void insert(String word) {
    _insert(word, root, 0);
  }

  void _insert(String word, TrieNode root, int idx) {
    if (idx == word.length) {
      root.isWord = true;
      return;
    }
    int index = word.codeUnitAt(idx) - 'a'.codeUnitAt(0);
    if (root.children[index] == null) {
      root.children[index] = TrieNode();
    }
    _insert(word, root.children[index]!, idx + 1);
  }

  // Returns if the word is in the trie.
  bool search(String word) {
    return _search(word, root, 0);
  }

  bool _search(String word, TrieNode root, int idx) {
    if (idx == word.length) {
      startWith = true;
      return root.isWord;
    }
    int index = word.codeUnitAt(idx) - 'a'.codeUnitAt(0);
    if (root.children[index] == null) {
      startWith = false;
      return false;
    }
    return _search(word, root.children[index]!, idx + 1);
  }

  // Returns if there is any word in the trie that starts with the given prefix.
  bool startsWith(String prefix) {
    _search(prefix, root, 0);
    return startWith;
  }
}

class TrieNode {
  List<TrieNode?> children;
  bool isWord;

  TrieNode()
      : children = List.filled(26, null),
        isWord = false;
}

/**
 * Your Trie object will be instantiated and called as such:
 * Trie obj = Trie();
 * obj.insert(word);
 * bool param2 = obj.search(word);
 * bool param3 = obj.startsWith(prefix);
 */
