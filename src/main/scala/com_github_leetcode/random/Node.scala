package com_github_leetcode.random

class Node(var _value: Int, var _next: Node = null, var _random: Node = null) {
    var value: Int = _value
    var next: Node = _next
    var random: Node = _random

    override def toString: String = {
        val result = new StringBuilder()
        result.append("[")
        result.append(value)
        if (random == null) {
            result.append(",null")
        } else {
            var randomIndex = 0
            var curr2 = this
            while (curr2.next != null && curr2 != random) {
                randomIndex += 1
                curr2 = curr2.next
            }
            result.append(",").append(randomIndex)
        }
        var curr = next
        while (curr != null) {
            result.append("],[")
            result.append(curr.value)
            if (curr.random == null) {
                result.append(",null")
            } else {
                var randomIndex = 0
                var curr2 = this
                while (curr2.next != null && curr2 != curr.random) {
                    randomIndex += 1
                    curr2 = curr2.next
                }
                result.append(",").append(randomIndex)
            }
            curr = curr.next
        }
        result.append("]")
        result.toString()
    }
}
