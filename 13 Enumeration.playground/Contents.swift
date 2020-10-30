import UIKit

let names = ["Taylor", "Justin", "Adele"]
for name in names { print(name) }

let pythos = Set(["Graham", "John", "Terry", "Eric", "Michael"])
for python in pythos { print(python) }

let movies = [4: "A new Hope",
              5: "The Empire Strikes Back",
              6: "Return of the Jedi"]
for movie in movies { print(movie) }


// MARK: - Iterating finite sequences

class LinkedList<T> {
    var start: LinkedListNode<T>?
}

class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}


let list = LinkedList<Int>()

let first = LinkedListNode(value: 1)
let second = LinkedListNode(value: 1)
let third = LinkedListNode(value: 2)
let fourth = LinkedListNode(value: 3)
let fifth = LinkedListNode(value: 5)
let sixth = LinkedListNode(value: 8)

list.start = first
first.next = second
second.next = third
third.next = fourth
fourth.next = fifth
fifth.next = sixth


// MARK: Conforming to IteratorProtocol and Sequence

class LinkedListIterator<T>: IteratorProtocol {
    
    // holds the item we're currently reading
    private var current: LinkedListNode<T>?
    
    // an initializer giving us the start of the list
    init(start: LinkedListNode<T>?) {
        current = start
    }
    
    // move one place along and return that node
    func next() -> LinkedListNode<T>? {
        // Чтобы мы могли вернуть первый элемент, а потом уже
        // "перелистнуть страницу"
        defer { current = current?.next }
        return current
    }
    
}

extension LinkedList: Sequence {

    func makeIterator() -> LinkedListIterator<T> {
        LinkedListIterator(start: start)
    }
    
}


for item in list {
    print(item.value)
}

var iterator = list.makeIterator()
while let node = iterator.next() {
    print(node.value)
}

