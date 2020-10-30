import UIKit

let font1 = UIFont.systemFont(ofSize: 32)
let font2 = UIFont.systemFont(ofSize: 32)
let font3 = UIFont.systemFont(ofSize: 32)
let font4 = UIFont.systemFont(ofSize: 32)

if font1 === font2 {
    print("Fonts are the same!")
}


struct CarBase {
    let manufacturer: String
    let model: String
    let size: CGSize
    let safetyRating: Int
}

struct Car {
    let base: CarBase
    let registration: String
    let color: UIColor
}

let jaguarXJ220 = CarBase(manufacturer: "Jaguar",
                          model: "XJ220",
                          size: .init(width: 2009, height: 4930), safetyRating: 4)

var jag1 = Car(base: jaguarXJ220,
               registration: "X118 CJM",
               color: .black)

var jag2 = Car(base: jaguarXJ220,
               registration: "X119 CJM",
               color: .red)
