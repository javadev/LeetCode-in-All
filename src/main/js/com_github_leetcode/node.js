class Node {
    constructor(val, next, random) {
        this.val = val ?? 0
        this.next = next ?? null
        this.random = random ?? null
    }

    toString() {
        const result = []
        let curr = this
        while (curr !== null) {
            const result2 = []
            result2.push(String(curr.val))
            if (curr.random === null) {
                result2.push('null')
            } else {
                let randomIndex = 0
                let curr2 = this
                while (curr2?.next !== null && curr2 !== curr.random) {
                    randomIndex++
                    curr2 = curr2.next
                }
                result2.push(String(randomIndex))
            }
            result.push(`[${result2.join(',')}]`)
            curr = curr.next
        }
        return `[${result.join(',')}]`
    }
};

export { Node }
