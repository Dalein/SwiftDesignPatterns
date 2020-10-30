import UIKit

struct Brewery {
    public private(set) var bestSellingBeer = "Guinness"
    
    lazy var revenue: Int = {
       print("Running expensive code")
        return 1_000_000_000
    }()
}

var diageo = Brewery()
print(diageo.bestSellingBeer)
