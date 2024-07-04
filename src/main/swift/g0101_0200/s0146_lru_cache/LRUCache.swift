// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Hash_Table #Design #Linked_List
// #Doubly_Linked_List #Udemy_Linked_List #Big_O_Time_O(1)_Space_O(capacity)
// #2024_06_27_Time_673_ms_(99.77%)_Space_33.4_MB_(73.43%)

class LRUCache {
    private class LruCacheNode {
        var key: Int
        var value: Int
        var prev: LruCacheNode?
        var next: LruCacheNode?
        
        init(_ k: Int, _ v: Int) {
            key = k
            value = v
        }
    }
    
    private var capacity: Int
    private var cacheMap: [Int: LruCacheNode] = [:]
    private var head: LruCacheNode?
    private var tail: LruCacheNode?
    
    init(_ cap: Int) {
        capacity = cap
    }
    
    func get(_ key: Int) -> Int {
        if let node = cacheMap[key] {
            moveToHead(node)
            return node.value
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = cacheMap[key] {
            node.value = value
            moveToHead(node)
        } else {
            if cacheMap.count < capacity {
                let newNode = LruCacheNode(key, value)
                cacheMap[key] = newNode
                if cacheMap.count == 1 {
                    head = newNode
                    tail = newNode
                } else {
                    newNode.next = head
                    head?.prev = newNode
                    head = newNode
                }
            } else {
                if let last = tail {
                    cacheMap.removeValue(forKey: last.key)
                    tail = last.prev
                    tail?.next = nil
                    if tail == nil {
                        head = nil
                    }
                    put(key, value)
                }
            }
        }
    }
    
    private func moveToHead(_ node: LruCacheNode) {
        if node === head {
            return
        }
        if node === tail {
            tail = node.prev
        }
        node.prev?.next = node.next
        node.next?.prev = node.prev
        node.prev = nil
        node.next = head
        head?.prev = node
        head = node
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
