// #Hard #Top_100_Liked_Questions #Sorting #Two_Pointers #Design #Heap_Priority_Queue #Data_Stream
// #Big_O_Time_O(n*log_n)_Space_O(n) #2024_12_21_Time_134_ms_(76.00%)_Space_83.2_MB_(52.42%)

var MedianFinder = function () {
    this.large = new Heap();
    this.small = new Heap();
};

/** 
 * @param {number} num
 * @return {void}
 */
MedianFinder.prototype.addNum = function (num) {
    if (this.small.length() === this.large.length()) {
        this.small.push(-num);
        this.large.push(-this.small.pop());
    } else {
        this.large.push(num);
        this.small.push(-this.large.pop());
    }
};

/**
 * @return {number}
 */
MedianFinder.prototype.findMedian = function () {
    if (this.small.length() === this.large.length()) {
        return (this.large.peek() - this.small.peek()) / 2;
    }
    return this.large.peek();
};

/**
 * Heap implementation
 */
var Heap = function () {
    this.heap = [0];
};

Heap.prototype.peek = function () {
    return this.heap[1] ?? null;
};

Heap.prototype.push = function (val) {
    this.heap.push(val);
    let i = this.heap.length - 1;
    let parI = Math.floor(i / 2);
    while (i > 1 && this.heap[i] < this.heap[parI]) {
        const tmp = this.heap[i];
        this.heap[i] = this.heap[parI];
        this.heap[parI] = tmp;
        i = parI;
        parI = Math.floor(i / 2);
    }
};

Heap.prototype.pop = function () {
    if (this.heap.length === 1) {
        return null;
    }
    if (this.heap.length === 2) {
        return this.heap.pop();
    }
    const res = this.heap[1];
    this.heap[1] = this.heap.pop();
    let i = 1;
    while (2 * i < this.heap.length) {
        const leftChildIdx = 2 * i;
        const rightChildIdx = 2 * i + 1;
        if (
            rightChildIdx < this.heap.length &&
            this.heap[rightChildIdx] < this.heap[leftChildIdx] &&
            this.heap[i] > this.heap[rightChildIdx]
        ) {
            const tmp = this.heap[i];
            this.heap[i] = this.heap[rightChildIdx];
            this.heap[rightChildIdx] = tmp;
            i = rightChildIdx;
        } else if (this.heap[i] > this.heap[leftChildIdx]) {
            const tmp = this.heap[i];
            this.heap[i] = this.heap[leftChildIdx];
            this.heap[leftChildIdx] = tmp;
            i = leftChildIdx;
        } else {
            break;
        }
    }
    return res;
};

Heap.prototype.length = function () {
    return this.heap.length - 1;
};

export { MedianFinder }
