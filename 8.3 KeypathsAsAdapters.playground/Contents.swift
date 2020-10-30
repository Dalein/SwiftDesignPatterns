import UIKit

struct Person {
    var socialSecurityNumber: String
    var name: String
}

struct Book {
    var isbn: String
    var title: String
}

let taylor = Person(socialSecurityNumber: "555-55-5555",
                    name: "Taylor Swift")

let wither1 = Book(isbn: "34gh-98jo-3916",
                   title: "The witcher")


// MARK: - Using keypaths

protocol Identifiable {
    associatedtype ID
    static var idKey: WritableKeyPath<Self, ID> { get }
}


extension Person: Identifiable {
    static let idKey = \Person.socialSecurityNumber
}

extension Book: Identifiable {
    static let idKey = \Book.isbn
}


func printID<T: Identifiable>(thing: T) {
    print(thing[keyPath: T.idKey])
}


printID(thing: taylor)


// MARK: - The same without keypaths

//protocol Identifiable {
//    associatedtype ID
//    var id: ID { get }
//}
//
//extension Book: Identifiable {
//    var id: String {
//        isbn
//    }
//}
//
//extension Person: Identifiable {
//    var id: String {
//        socialSecurityNumber
//    }
//}
//
//
//func printID<T: Identifiable>(thing: T) {
//    print(thing.id)
//}
//
//
//printID(thing: taylor)
