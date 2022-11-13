import UIKit
import Foundation
var greeting = "Hello, playground"


//method requiments

protocol MyRandomNumberGenerator {
    func random() -> Double
    
}

class TwoChoiceRandomGenerator: MyRandomNumberGenerator {
    
    var firstChoice: Double = 0.0
    var secondChoice: Double = 0.0
    
    init(first: Double, second: Double) {
        firstChoice = first
        secondChoice = second
    }
    
    func random() -> Double {
        Bool.random() ? firstChoice : secondChoice
    }
}

let twoChoiceGenerator = TwoChoiceRandomGenerator(first: 5, second: 10)
let randm = twoChoiceGenerator.random()

//mutating method requirements

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case on, off
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

//initializer requirements
protocol SomeInitProtocol {
    init(someParameter: Int)
}

class SomeMyClass: SomeInitProtocol {
    required init(someParameter: Int) {}
}

protocol SomeOtherInitProtocol {
    init()
}

class SomeSuperClass {
    init() {}
}

class SomeSubclass: SomeSuperClass, SomeOtherInitProtocol {
    required override init() {}
}

//protocols as types

class Dice {
    let sides: Int
    let generator: MyRandomNumberGenerator
    init(sides: Int, generator: MyRandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var specialDice = Dice(sides: 6, generator: TwoChoiceRandomGenerator(first: 1, second: 2))

for _ in 1...5 {
    print("Random dice roll is \(specialDice.roll())")
}

//chencking for protocol conformance
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.14
    var radius: Double
    var area: Double {
        return pi * radius * radius
    }
    init(radius: Double) {
        self.radius = radius
    }
}

class Counrty: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [Circle(radius: 2.0), Counrty(area: 243000), Animal(legs: 4)]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Someting that doenst have an area")
    }
}

// protocols extensions

extension MyRandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let generator = TwoChoiceRandomGenerator(first: 0.1, second: 0.8)
print("here is a random number \(generator.random())")
print("and here is a random boolen \(generator.randomBool())")

extension PrettyTextRepresentable {
    var prettyTextaualDescription: String {
        return textualDescription
    }
}
