import UIKit

protocol Purchasable: Item {
    var price: Decimal { get set }
    func purchase()
}

protocol Printable: Item {
    var printFile: URL { get set }
    func printOut()
}

protocol Borrowable: Item {
    var borrowers: [String] { get set }
    mutating func lend(to: String)
}

protocol Listenable: Item {
    var audioFile: URL { get set }
    func playPreview()
}


struct Book: Purchasable, Printable, Borrowable {
    var name: String
    var price: Decimal
    var printFile: URL
    var borrowers: [String]
}

struct AudioBook: Purchasable, Listenable, Borrowable {
    var name: String
    var price: Decimal
    var audioFile: URL
    var borrowers: [String]
}


extension Purchasable {
    func purchase() {
        print("Bought \(name)!")
    }
}


extension Printable {
    func printOut() {
        print("Printing...")
    }
}

extension Borrowable {
    mutating func lend(to person: String) {
        borrowers.append(person)
    }
}


extension Listenable {
    func playPreview() {
        print("Previewing")
    }
}


struct Magazine: Purchasable {
    var name: String
    var price: Decimal
}


protocol Item {
    var name: String { get set }
    
}
