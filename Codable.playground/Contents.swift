import UIKit

struct Settings: Codable {
    var username: String
    var age: Int
    var lastLogin: Date
    var friends: [String]
    var darkMode: Bool
}


let settings = Settings(
    username: "ololo",
    age: 28,
    lastLogin: Date(),
    friends: ["Lolka1", "Lolka2"],
    darkMode: true)


// archiving
let encoder = JSONEncoder()
encoder.dateEncodingStrategy = .iso8601
encoder.outputFormatting = .prettyPrinted
let settingsData = try! encoder.encode(settings)


// unarchiving
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601
let loadedSettings = try! decoder.decode(Settings.self, from: settingsData)
