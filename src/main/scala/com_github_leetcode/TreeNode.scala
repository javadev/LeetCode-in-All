package com_github_leetcode

import scala.collection.mutable

class TreeNode(var value: Int, var left: TreeNode = null, var right: TreeNode = null) {
    override def toString: String = {
        if (left == null && right == null) {
            value.toString
        } else {
            val root = value.toString
            val leftValue = Option(left).map(_.toString).getOrElse("null")
            val rightValue = Option(right).map(_.toString).getOrElse("null")
            s"$root,$leftValue,$rightValue"
        }
    }
}

object TreeNode {
    def create(treeValues: List[Option[Int]]): TreeNode = {
        if (treeValues.isEmpty) {
            null
        } else {
            val root = new TreeNode(treeValues.head.getOrElse(0))
            val queue = mutable.Queue(root)
            var i = 1
            while (i < treeValues.length) {
                val curr = queue.dequeue()
                if (treeValues(i).isDefined) {
                    curr.left = new TreeNode(treeValues(i).get)
                    queue.enqueue(curr.left)
                }
                i += 1
                if (i < treeValues.length && treeValues(i).isDefined) {
                    curr.right = new TreeNode(treeValues(i).get)
                    queue.enqueue(curr.right)
                }
                i += 1
            }
            root
        }
    }
}
