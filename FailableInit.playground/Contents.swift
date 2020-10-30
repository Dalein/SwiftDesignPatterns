import UIKit


class Animal {
    var type: String?
    
    init() {}
    
    init?(type: String) {
        guard !type.isEmpty else { return nil }
        self.type = type
    }
    
}


class Dog: Animal {
    
    override init(type: String) {
        super.init()
        
        if type.isEmpty {
            self.type = "Dog"
        } else {
            self.type = type
        }
    }
    
    
}
