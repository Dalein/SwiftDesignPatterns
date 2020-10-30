import UIKit

protocol ScoreAccessory {
    func string(for score: Int) -> String
}


struct TitleAccessory: ScoreAccessory {
    
    func string(for score: Int) -> String {
        "Score: "
    }
    
}


struct PointsAccessory: ScoreAccessory {
    
    func string(for score: Int) -> String {
        score == 1 ? " POINT" : "POINTS"
    }
    
}


struct ScoreLabel {
    var prefix: ScoreAccessory?
    var suffix: ScoreAccessory?
    
    
}
