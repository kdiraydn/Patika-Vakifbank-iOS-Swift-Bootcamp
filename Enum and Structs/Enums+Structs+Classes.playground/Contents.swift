import UIKit
import Foundation


//enumerations

//syntax

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead: CompassPoint = .west

directionToHead = .south

// bu case içerisinde enumdaki tüm caseler kontrol edildiyse default case yazmamıza gerek kalmıyor. alttaki case yazıyor.

switch directionToHead {
case .north:
    print("North")
case .south:
    print("South")
case .east:
    print("East")
case .west:
    print("West")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Earth")
default:
    print("Different")
}

// iterasting
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoice = Beverage.allCases.count

for beverage in Beverage.allCases {
    print(beverage)
}

//associated values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qr(String)
}

var productBarcode = Barcode.upc(8, 85909, 51225, 3)
productBarcode = .qr("ABCDVfsdkls")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("\(numberSystem)")
case .qr(let productCode):
    print("\(productCode)")
}

//raw values
enum MilkywayPlanet: Int {
    case mercury = 1
    case venus
    case mars
}

enum Compass: String {
    case north, south
}


//structs classes
//definition syntax

struct Resolution {
    var width = 0
    var hight = 0
}

class VideoMode {
    var resolution = Resolution()
    var frameRate = 0.0
    var name: String?
}

// structure and class ınstances
let someResolution = Resolution()
let vga = Resolution(width: 640, hight: 480)
let someVideoMode = VideoMode()

// accessing proterties
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280

//structlar ve enumarationslar value typelar iken classlar referans type
//struct ve enamlarda bu objelerin bir kopyaları oluşturulur ve buralarda yaptığımız değişiklikler birbirilerini etkilemezç
//hd buradan instance demek oluyor
let hd = Resolution(width: 1920, hight: 1080)
var cinema = hd
cinema.width = 2048

print("hd ise now \(hd.width)")
print("Cinema is now \(cinema.width)")

enum CompassDirection {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassDirection.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()
print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

//classes are referance type
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTengEighty = tenEighty
alsoTengEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
print("The frameRate property of tenEighty is now \(alsoTengEighty.frameRate)")
 


//Stored
///burası eksik 09:00'da anlattı.

var rangeOfThreeItems = FixedLenghtRange(firstValue: 0, lenght: 3)
rangeOfThreeItems.firstValue = 6


//lazy (sadace var ile kullanılır let ile kullanılamaz.)
class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter() //bunu çağırmazsam hiç oluşturulmuyor.
    var data: [String] = []
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
print(manager.importer.filename)

//computed properties
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        mutating get {
            let centerX = origin.x = (size.width / 2)
            let centerY = origin.y = (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set (newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}


