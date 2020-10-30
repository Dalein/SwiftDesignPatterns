import UIKit

struct Character {
    var name: String
    var city: City
}

struct City {
    var name: String
    var sights: [String]
}


let london = City(name: "London",
                  sights: ["Tower of London",
                           "Buckingham Palace"])

let bear = Character(name: "Paddington Bear",
                     city: london)

let detective = Character(name: "Sherlock Holmes",
                          city: london)

let spy = Character(name: "James Bond", city: london)

print(spy.city.name)

let characterName = \Character.name

print(bear[keyPath: characterName])
print(detective[keyPath: characterName])
print(spy[keyPath: characterName])


let citName = \Character.city.name
print(spy[keyPath: citName])


let exampleSight = \Character.city.sights[0]
let characterSight = spy[keyPath: exampleSight]
print(characterSight)

