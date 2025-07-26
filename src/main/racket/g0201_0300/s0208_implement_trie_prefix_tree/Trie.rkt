; #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Design #Trie
; #LeetCode_75_Trie #Level_2_Day_16_Design #Udemy_Trie_and_Heap #Top_Interview_150_Trie
; #Big_O_Time_O(word.length())_or_O(prefix.length())_Space_O(N)
; #2025_02_10_Time_102_ms_(100.00%)_Space_134.45_MB_(100.00%)

(define trie%
  (class object%
    (super-new)

    ;; Define TrieNode struct
    (struct trie-node (children is-word?) #:mutable)

    ;; Root node of the Trie
    (init-field)
    (define root (trie-node (make-hash) #f))
    (define start-with? #f)

    ;; Inserts a word into the trie.
    (define/public (insert word)
      (define (insert-helper node word idx)
        (if (= idx (string-length word))
            (set-trie-node-is-word?! node #t)
            (let* ([ch (string-ref word idx)]
                   [children (trie-node-children node)]
                   [next-node (hash-ref children ch (lambda () (trie-node (make-hash) #f)))])
              (hash-set! children ch next-node)
              (insert-helper next-node word (+ idx 1)))))
      (insert-helper root word 0))

    ;; Searches for a word in the trie.
    (define/public (search word)
      (define (search-helper node word idx)
        (if (= idx (string-length word))
            (begin
              (set! start-with? #t)
              (trie-node-is-word? node))
            (let* ([ch (string-ref word idx)]
                   [children (trie-node-children node)]
                   [next-node (hash-ref children ch #f)])
              (if next-node
                  (search-helper next-node word (+ idx 1))
                  (begin
                    (set! start-with? #f)
                    #f)))))
      (search-helper root word 0))

    ;; Checks if any word in the trie starts with the given prefix.
    (define/public (starts-with prefix)
      (send this search prefix)
      start-with?)))

;; Your trie% object will be instantiated and called as such:
;; (define obj (new trie%))
;; (send obj insert word)
;; (define param_2 (send obj search word))
;; (define param_3 (send obj starts-with prefix))
