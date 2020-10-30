import UIKit

let numbers = Array(1...1000)

extension Array where Element == Int {
    
    var total: Element {
        reduce(0, +)
    }
    
}


extension Collection where Element: Hashable {
    
    var isUnique: Bool {
        self.count == Set(self).count
    }
    
}


[1, 2, 3, 4, 5, 1].isUnique
"Forget your trouble c'mon get happy".isUnique


extension String {
    
    var isUnique: Bool {
        let words = self.components(separatedBy: " ")
        return words.count == Set(words).count
    }
    
}
