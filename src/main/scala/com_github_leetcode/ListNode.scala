package com_github_leetcode

class ListNode(_x: Int = 0, _next: ListNode = null) {
    var next: ListNode = _next
    var x: Int = _x

    override def toString: String = {
        val result = new StringBuilder(x.toString)
        var current = next
        while (current != null) {
            result.append(", ")
            result.append(current.x)
            current = current.next
        }
        result.toString
    }
}
