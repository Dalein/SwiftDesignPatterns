import UIKit

struct FibonacciGenerator {
    var previous: UInt64 = 0
    var current: UInt64 = 1
}

extension FibonacciGenerator: Sequence, IteratorProtocol {
    
    mutating func next() -> UInt64? {
        defer {
            let next = previous + current
            previous = current
            current = next
        }
        
        return current
    }
    
}


var count = 0
for fib in FibonacciGenerator() {
    print(fib)
    count += 1

    if count == 25 { break }
}


// Or like this:

var fib = FibonacciGenerator()
for i in 0...91 {
    let fibElement = fib.next()!
    print(fibElement)
    print(i)
    
}

let fib91: UInt64 = 4_660_046_610_375_530_309
let fib92: UInt64 = 7_540_113_804_746_346_429

let goldenRatio = Double(fib92) / Double(fib91)
print("goldenRatio: \(goldenRatio)")
