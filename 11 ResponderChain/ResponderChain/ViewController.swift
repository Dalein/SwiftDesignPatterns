//
//  ViewController.swift
//  ResponderChain
//
//  Created by daleijn on 18.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}


extension UIView {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("UIView")
        next?.touchesBegan(touches, with: event)
    }
}

extension UIViewController {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("UIViewController")
        next?.touchesBegan(touches, with: event)
    }
}

extension UIWindow {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("UIWindow")
        next?.touchesBegan(touches, with: event)
    }
}

extension AppDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("AppDelegate")
    }
}
