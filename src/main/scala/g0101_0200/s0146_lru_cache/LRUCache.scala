package g0101_0200.s0146_lru_cache

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Hash_Table #Design #Linked_List
// #Doubly_Linked_List #Udemy_Linked_List #Big_O_Time_O(1)_Space_O(capacity)
// #2023_11_04_Time_1590_ms_(85.19%)_Space_178.7_MB_(14.81%)

class LRUCache(capacity: Int) {
    case class LRUCacheNode(key: Int, var value: Int, var prev: LRUCacheNode = null, var next: LRUCacheNode = null)

    private var cacheMap: Map[Int, LRUCacheNode] = Map.empty
    private var head: LRUCacheNode = null
    private var tail: LRUCacheNode = null

    def get(key: Int): Int = {
        val node = cacheMap.get(key)
        if (node.isEmpty) {
            return -1
        }
        moveToHead(node.get)
        node.get.value
    }

    def put(key: Int, value: Int): Unit = {
        val node = cacheMap.get(key)
        if (node.isDefined) {
            node.get.value = value
            moveToHead(node.get)
        } else {
            if (cacheMap.size < capacity) {
                if (cacheMap.isEmpty) {
                    val newNode = LRUCacheNode(key, value)
                    cacheMap += (key -> newNode)
                    head = newNode
                    tail = newNode
                } else {
                    val newNode = LRUCacheNode(key, value)
                    cacheMap += (key -> newNode)
                    newNode.next = head
                    head.prev = newNode
                    head = newNode
                }
            } else {
                val last = tail
                tail = last.prev
                if (tail != null) {
                    tail.next = null
                }
                cacheMap -= last.key
                if (cacheMap.isEmpty) {
                    head = null
                }
                put(key, value)
            }
        }
    }

    private def moveToHead(node: LRUCacheNode): Unit = {
        if (node == head) {
            return
        }
        if (node == tail) {
            tail = node.prev
        }
        val prev = node.prev
        val next = node.next
        prev.next = next
        if (next != null) {
            next.prev = prev
        }
        node.prev = null
        node.next = head
        head.prev = node
        head = node
    }
}
