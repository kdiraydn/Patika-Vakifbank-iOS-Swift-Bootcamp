import UIKit
import Foundation


//without generics

func swapTwoInsts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInsts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
 
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//generic functions
func swapTwoValues<T>(a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var myInt = 3
var myAnotherInt = 107
print("some is now \(myInt), and anotherInt ise now \(myAnotherInt)")

var myString = "hello"
var myAnotherString = "world"
swapTwoValues(a: &myString, &myAnotherString)
print("myString is now \(myString), and myAnotherString is now \(myAnotherString)")

//generic types
//non generic
struct IntStack {
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

//generic
struct Stack<Element> {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<Any>()
stackOfStrings.push("uno")
stackOfStrings.push(1)
stackOfStrings.push("tres")
let fromTheTop = stackOfStrings.pop()

//extending a generic type
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

//type constraint
//non generic
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "lama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "lama", in: strings) {
    print("the index o lama ise \(foundIndex)")
}

//generic
func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for(index, value) in array.enumerated() {
        if value == valueToFind {
            return index
    }
    
    }
    return nil
}

let stringIndex = findIndex(ofString: "andrea", in: ["mike", "malcolm", "andrea"])
let doubleIndex = findIndex(of: 9.3, in: [3.14, 0.1, 0.25])

//associated type
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct NewIntStack: Container {
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

//adding constrainsts to an associated type
protocol NewContainer {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
    
//generic where clauses
func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item:Equatable {
    return true
}
