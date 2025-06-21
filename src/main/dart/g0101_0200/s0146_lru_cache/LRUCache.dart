// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Hash_Table #Design #Linked_List
// #Doubly_Linked_List #Udemy_Linked_List #Top_Interview_150_Linked_List
// #Big_O_Time_O(1)_Space_O(capacity) #2024_10_07_Time_640_ms_(81.25%)_Space_235.3_MB_(87.50%)

class LRUCache {
  int length = 0;
  Map cache = {};
  LRUCache(int capacity) {
    length = capacity;
  }

  int get(int key) {
    if (cache[key] == null) {
      return -1;
    } else {
      var value = cache[key];
      cache.remove(key);
      cache[key] = value;
      return value;
    }
  }

  void put(int key, int value) {
    if (cache[key] != null) {
      cache.remove(key);
    }
    cache[key] = value;
    if (length < cache.keys.length) {
      cache.remove(cache.keys.first);
    }
  }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache obj = LRUCache(capacity);
 * int param1 = obj.get(key);
 * obj.put(key,value);
 */
