146\. LRU Cache

Medium

Design a data structure that follows the constraints of a **[Least Recently Used (LRU) cache](https://en.wikipedia.org/wiki/Cache_replacement_policies#LRU)**.

Implement the `LRUCache` class:

*   `LRUCache(int capacity)` Initialize the LRU cache with **positive** size `capacity`.
*   `int get(int key)` Return the value of the `key` if the key exists, otherwise return `-1`.
*   `void put(int key, int value)` Update the value of the `key` if the `key` exists. Otherwise, add the `key-value` pair to the cache. If the number of keys exceeds the `capacity` from this operation, **evict** the least recently used key.

The functions `get` and `put` must each run in `O(1)` average time complexity.

**Example 1:**

**Input** ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"] [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]

**Output:** [null, null, null, 1, null, -1, null, -1, 3, 4]

**Explanation:**

    LRUCache lRUCache = new LRUCache(2);
    lRUCache.put(1, 1); // cache is {1=1}
    lRUCache.put(2, 2); // cache is {1=1, 2=2}
    lRUCache.get(1); // return 1
    lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
    lRUCache.get(2); // returns -1 (not found)
    lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
    lRUCache.get(1); // return -1 (not found)
    lRUCache.get(3); // return 3
    lRUCache.get(4); // return 4 

**Constraints:**

*   `1 <= capacity <= 3000`
*   <code>0 <= key <= 10<sup>4</sup></code>
*   <code>0 <= value <= 10<sup>5</sup></code>
*   At most 2<code> * 10<sup>5</sup></code> calls will be made to `get` and `put`.

To solve the "LRU Cache" problem, we need to implement a data structure that efficiently supports the `get` and `put` operations while maintaining the least recently used (LRU) policy. We can achieve this using a combination of a dictionary and a doubly linked list.

### Steps to Implement the LRU Cache

1. **Initialization:**
   - Create a class `LRUCache` with an initializer that takes the capacity of the cache.
   - Use a dictionary to store the key-value pairs for O(1) access.
   - Use a doubly linked list to maintain the order of access for the LRU policy.

2. **Node Class:**
   - Define a nested `Node` class for the doubly linked list nodes, which includes properties for the key, value, previous node, and next node.

3. **Doubly Linked List:**
   - Maintain a dummy head and tail to facilitate easy addition and removal of nodes.
   - Implement methods to add a node right after the head and remove a node from the linked list.

4. **Get Operation:**
   - If the key exists in the dictionary, move the corresponding node to the head of the linked list and return its value.
   - If the key does not exist, return -1.

5. **Put Operation:**
   - If the key exists, update the value and move the corresponding node to the head of the linked list.
   - If the key does not exist, add a new node to the head of the linked list and update the dictionary.
   - If the cache exceeds its capacity, remove the node just before the tail (the least recently used node) and delete it from the dictionary.

### Swift Implementation

Here’s the Swift implementation of the `LRUCache` class:

```swift
class LRUCache {

    private class Node {
        var key: Int
        var value: Int
        var prev: Node?
        var next: Node?
        
        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    private var capacity: Int
    private var dict = [Int: Node]()
    private var head = Node(0, 0)
    private var tail = Node(0, 0)
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            moveToHead(node)
            return node.value
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.value = value
            moveToHead(node)
        } else {
            let newNode = Node(key, value)
            dict[key] = newNode
            addNode(newNode)
            if dict.count > capacity {
                if let tail = removeTail() {
                    dict.removeValue(forKey: tail.key)
                }
            }
        }
    }
    
    private func addNode(_ node: Node) {
        node.prev = head
        node.next = head.next
        head.next?.prev = node
        head.next = node
    }
    
    private func removeNode(_ node: Node) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
    }
    
    private func moveToHead(_ node: Node) {
        removeNode(node)
        addNode(node)
    }
    
    private func removeTail() -> Node? {
        let node = tail.prev
        if let node = node {
            removeNode(node)
        }
        return node
    }
}
```

### Explanation of the Swift Code

1. **Node Class:**
   - The `Node` class represents each node in the doubly linked list, with `key`, `value`, `prev`, and `next` properties.

2. **LRUCache Initialization:**
   - The initializer sets the capacity and initializes the dummy head and tail nodes to facilitate easy node additions and removals.

3. **Add and Remove Node:**
   - `addNode(_:)` inserts a node right after the head.
   - `removeNode(_:)` removes a node from its current position.
   - `moveToHead(_:)` removes a node and then adds it right after the head.
   - `removeTail()` removes the node just before the tail, which is the least recently used node.

4. **Get Operation:**
   - The `get(_:)` method checks if the key exists in the dictionary. If it does, it moves the node to the head and returns its value. Otherwise, it returns -1.

5. **Put Operation:**
   - The `put(_:)` method updates the node's value if the key exists and moves it to the head.
   - If the key does not exist, it creates a new node, adds it to the head, and updates the dictionary.
   - If the cache exceeds its capacity, it removes the least recently used node (node just before the tail) and deletes it from the dictionary.

This implementation ensures that both `get` and `put` operations run in O(1) time complexity, adhering to the problem constraints.