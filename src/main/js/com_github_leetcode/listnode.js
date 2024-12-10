class ListNode {
    constructor(val, next) {
        this.val = val === undefined ? 0 : val
        this.next = next === undefined ? null : next
    }

    toString() {
        let result = `${this.val}`
        let current = this.next
        while (current !== null) {
            result += `, ${current.val}`
            current = current.next
        }
        return result
    }
}

export { ListNode }
