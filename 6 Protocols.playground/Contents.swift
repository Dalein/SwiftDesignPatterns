import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum SomeEnum {
    case option1
}


@objc protocol MoviewPlayerDelegate {
    @objc optional func moviewShoudPause() -> Bool
    func moviewWillEnd()
    
    /**
     Error:  **Method cannot be a member of an @objc protocol because the type of the parameter cannot be represented in Objective-C**
     
    func foo(with option: SomeEnum)
    */
}



struct MoviewPlayer {
    var delegate: MoviewPlayerDelegate?
    
    func pausePressed() -> Bool {
        delegate?.moviewShoudPause?() ?? true
    }
    
}


class Listener: MoviewPlayerDelegate {
    
    func moviewWillEnd() {
        
    }

}

var player = MoviewPlayer()
var listerner = Listener()

