import UIKit

/**
 ```
protocol Identifiable {
    var id: Int { get set }
}


struct Person: Identifiable {
    var id: Int
}

struct Webpage: Identifiable {
    var id: Int
}
 ```
 */

protocol Identifiable {
    associatedtype IDType
    var id: IDType { get set }
}


struct Person: Identifiable {
    var id: String
}

struct Webpage: Identifiable {
    var id: URL
}


let taylor = Person(id: "555-55-5555")



/**
 This is not legal
 
 Protocol 'Identifiable' can only be used as a generic constraint because it has Self or associated type requirements
 
 `let taylor2: Identifiable = Person(id: "555-55-5555")`
 
 `let arrayOfIdentifiable = [Identifiable]()`
 */


func checkIdentification<T: Identifiable>(object: T) {
    
}


extension Numeric {
    func squared() -> Self {
        self * self
    }
}
