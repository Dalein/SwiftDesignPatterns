import UIKit

class CoffeeShop: NSObject {
    @objc dynamic var remainingBeans = 10_000
}


let blueBottle = CoffeeShop()

blueBottle.observe(\.remainingBeans, options: .new) { (coffeeShop, change) in
    print(coffeeShop.remainingBeans)
}

blueBottle.remainingBeans -= 1
blueBottle.remainingBeans -= 5
blueBottle.remainingBeans -= 10



let vw = UIView()

vw.observe(\.isHidden, options: .new) { (view, change) in
    print(view.isHidden)
}

vw.isHidden.toggle()
vw.isHidden.toggle()
vw.isHidden.toggle()
