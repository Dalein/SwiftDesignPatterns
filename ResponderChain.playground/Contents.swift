import UIKit


protocol Responder {
    var next: Responder? { get set }
    func run(selector: Selector)
}


class Control: NSObject, Responder {
    var next: Responder?
    
    
    // MARK: - Init
    
    init(next: Responder? = nil) {
        self.next = next
    }
    
    func run(selector: Selector) {
        guard responds(to: selector) else {
            print("Forwading to next responder")
            next?.run(selector: selector)
            return
        }
        perform(selector)
    }
    
}


class MessagingControl: Control {
    
    @objc func printMessage() {
        print("Running!")
    }
    
}


let root = MessagingControl()
let first = Control(next: root)
let second = Control(next: first)
let third = Control(next: second)

let action = #selector(MessagingControl.printMessage)

third.run(selector: action)


