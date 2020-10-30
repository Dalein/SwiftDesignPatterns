import UIKit

struct Settings: Codable {
    
    enum CodingKeys: String, CodingKey {
        case username
        case age
        case lastLogin
        case friends
        case darkMode
        case favoriteColor = "favorite_color"
    }
    
    var username: String
    var age: Int
    var lastLogin: Date
    var friends: [String]
    var darkMode: Bool
    var favoriteColor: UIColor
    
    
    // MARK: Encoding
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(username, forKey: .username)
        try container.encode(age, forKey: .age)
        try container.encode(lastLogin, forKey: .lastLogin)
        try container.encode(friends, forKey: .friends)
        try container.encode(darkMode, forKey: .darkMode)
        
        let colorData = NSKeyedArchiver.archivedData(withRootObject: favoriteColor)
        try container.encode(colorData, forKey: .favoriteColor)
        
    }
    
    // MARK: Decoding
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        username = try container.decode(String.self, forKey: .username)
        age = try container.decode(Int.self, forKey: .age)
        lastLogin = try container.decode(Date.self, forKey: .lastLogin)
        friends = try container.decode([String].self, forKey: .friends)
        darkMode = try container.decode(Bool.self, forKey: .darkMode)
        
        let colorData = try container.decode(Data.self, forKey: .favoriteColor)
        favoriteColor = {
            guard let color = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor
                else { return .clear }
            return color
        }()
        
        if !friends.contains("Tom") {
            friends.append("Tom")
        }
    }
    
    
    // MARK: Init
    
    init(username: String, age: Int,
         lastLogin: Date, friends: [String], darkMode: Bool,
         favoriteColor: UIColor)
    {
        self.username = username
        self.age = age
        self.lastLogin = lastLogin
        self.friends = friends
        self.darkMode = darkMode
        self.favoriteColor = favoriteColor
    }
    
}


let settings = Settings(username: "Piter", age: 44, lastLogin: Date.distantPast, friends: [], darkMode: false,
                        favoriteColor: .green)


// archiving
let encoder = JSONEncoder()
encoder.dateEncodingStrategy = .iso8601
encoder.outputFormatting = .prettyPrinted
let settingsData = try! encoder.encode(settings)

let str = String(data: settingsData, encoding: .utf8)

// unarchiving
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601
let loadedSettings = try! decoder.decode(Settings.self, from: settingsData)
