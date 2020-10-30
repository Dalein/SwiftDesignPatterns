import UIKit

protocol Purchasable {
    var price: Decimal { get set }
    func purchase()
}

protocol Printable {
    var printFile: URL { get set }
    func printOut()
}

protocol Borrowable {
    var borrowers: [String] { get set }
    mutating func lend(to: String)
}

protocol Listenable {
    var audioFile: URL { get set }
    func playPreview()
}


struct Book: Purchasable, Printable, Borrowable {
    var name: String
    var price: Decimal
    var printFile: URL
    var borrowers: [String]
    
    func purchase() {}
    
    func printOut() {}
    
    mutating func lend(to: String) {}

}

struct AudioBook: Purchasable, Listenable, Borrowable {
    var name: String
    var price: Decimal
    var audioFile: URL
    var borrowers: [String]
    
    func purchase() {}
    func playPreview() {}
    mutating func lend(to: String) {}
    
}
