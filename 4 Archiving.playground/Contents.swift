import UIKit

class Settings: NSObject, NSCoding {
    var username: String
    var age: Int
    var lastLogin: Date
    var friends: [String]
    var darkMode: Bool
    
    
    init(username: String, age: Int, lastLogin: Date, friends: [String], darkMode: Bool) {
        self.username = username
        self.age = age
        self.lastLogin = lastLogin
        self.friends = friends
        self.darkMode = darkMode
    }
    
    
    // MARK: - NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(username, forKey: "username")
        coder.encode(age, forKey: "age")
        coder.encode(lastLogin, forKey: "lastLogin")
        coder.encode(friends, forKey: "friends")
        coder.encode(darkMode, forKey: "darkMode")
    }
    
    required init?(coder: NSCoder) {
        self.username = coder.decodeObject(forKey: "username") as! String
        self.age = coder.decodeInteger(forKey: "age")
        self.lastLogin = coder.decodeObject(forKey: "lastLogin") as! Date
        self.friends = coder.decodeObject(forKey: "friends") as! [String]
        self.darkMode = coder.decodeBool(forKey: "darkMode")
    }
    
}


let settings = Settings(
    username: "ololo",
    age: 28,
    lastLogin: Date(),
    friends: ["Lolka1", "Lolka2"],
    darkMode: true)

// archiving
let settingsData = NSKeyedArchiver.archivedData(withRootObject: settings)

// unarchiving
if let loadedSettings = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(settingsData) {
    print("loadedSettings: \(loadedSettings)")
}
