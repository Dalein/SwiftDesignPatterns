import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


extension Notification.Name {
    static let HWSSettingsDidChange = Notification.Name("HWSSettingsDidChangeNotification")
}


class Controller {
    private let id: Int
    
    let op = OperationQueue()
    
    init(id: Int) {
        self.id = id
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadSettings(note:)), name: .HWSSettingsDidChange, object: nil)
    }
    
    
    @objc func reloadSettings(note: Notification) {
//        print("reloadSettings for id: \(id)")
        
        if let userInfo = note.userInfo {
            print("userInfo: \(userInfo)")
        }
        
        if let object = note.object {
            print("object: \(object)")
        }
        
//        for i in 0...5 {
//            usleep(UInt32.random(in: 0...1500))
//            print("do heavy reloadSettings work \(i)")
//        }
    }
    
}



let controller1 = Controller(id: 1)
//let controller2 = Controller(id: 2)
//let controller3 = Controller(id: 3)
//let controller4 = Controller(id: 4)
//let controller5 = Controller(id: 5)


// MARK: - Sync Notifications
//
//print("Do a post")
//NotificationCenter.default.post(name: .HWSSettingsDidChange, object: nil)
//print("Continue execution")


// MARK: - Async Notifications


//print("Do a post")
//
//let notif = Notification(name: .HWSSettingsDidChange)
//NotificationQueue.default.enqueue(notif,
//                                  postingStyle: .whenIdle,
//                                  coalesceMask: .none,
//                                  forModes: nil)
//
//print("Continue execution")




// MARK: - Attaching data

NotificationCenter.default.post(name: .HWSSettingsDidChange,
                                object: "ololo",
                                userInfo: ["theme": "dark"])
