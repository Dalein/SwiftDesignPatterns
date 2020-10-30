import UIKit

class BookStore: NSObject {
    
    let manager = Manager()
    
    
    func open() {
        perform(#selector(turnOnLights), with: 10)
        perform(#selector(openDoors))
        
        let customer = Customer(name: "Taylor Swift")
        let sel = NSSelectorFromString("greet:")
        perform(sel, with: customer)
        
        perform(#selector(startMusic), with: nil, afterDelay: 10)
        
        perform(NSSelectorFromString("handleComplaint"))
        
        
    }
    
    @objc func turnOnLights(intensity: NSNumber) {
        print("The lights are on at intensity \(intensity.intValue)")
    }
    
    @objc func openDoors() {
        print("The doors are open")
    }
    
    @objc func greet(_ customer: Customer) {
        print("Hello, \(customer.name)")
    }
    
    @objc func startMusic() {
        print("start playing music")
    }

    
    // MARK: - Message forwarding
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        return manager
    }
    
}

class Customer: NSObject {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}


let store = BookStore()
store.open()



class Manager {

    @objc func handleComplaint() {
        print("Manager | Here's a refund and a free latte.")
    }
    
}


