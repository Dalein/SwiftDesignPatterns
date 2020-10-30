import UIKit

let str: String
let regularOptional: String? = "hello"
let implicitlyUnwrapped: String! = "hello"


let message = "hello" as AnyObject

message.viewDidLoad?()


let lol = 4 as Double
print(lol)

let lol2 = 4 as? Double
print(lol2)
