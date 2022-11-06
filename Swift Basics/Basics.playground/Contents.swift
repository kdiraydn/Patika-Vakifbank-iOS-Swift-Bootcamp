import UIKit
import Foundation

var greeting = "Hello Bro"

// basics
//constants and variables
let maximumNumberOfLoginAttemps = 10
var currentLoginAttemp = 0
var numberOfItem = 0, keyCount = 0.0, basketTotal = 0.0
print(keyCount)
//Type Annotation
var welcomeMessage: String
welcomeMessage = "Hello"

//Naming constants and variables

// burası a.swift
var 😄 = "Work"
//burası b.swift
😄 += " Home"

let languageName = "Swift"

//printing

print(languageName)
print("Number of login attemp is \(maximumNumberOfLoginAttemps)")

let animalCount: Int

animalCount = 3

//floating point
let bottlePrice: Double = 5.6
let plantPrice: Float = 10.71

//Boolens
let orangeAreOrange = true
let turnipsAreDelicius = false

if turnipsAreDelicius {
    print("Tasty")
} else {
    print("Emw, horrible")
}

//Tuples
let http404Error = (404, "Not Found")
let (statusCode, StatusMessage) = http404Error

statusCode
StatusMessage

//Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("Integer value Succes")
}

if let realNumber = Int(possibleNumber) {
    print("Actual number is \(realNumber)")
}

if let convertedNumber {
    print("Actual number is \(convertedNumber)")
}

guard let number = Int(possibleNumber) else { throw NSError() }


/*func foo() {
    guard let number = Int(possibleNumber) else { return }
}
*/

//operators - asasigment operator
var goalCount = 5
goalCount += 10

//aritmetic operators
1 + 2
9 % 4

//unary minus operator
let three = 3
let minus = -three
let plusThree = -minus

//comparison operators

1 == 1
2 != 1
2 < 1
1 <= 1

let name = "World"
if name == "World" {
    print("Returned True")
} else {
    print("Returned False")
}

var appeles = 3
var oranges = 5

//while oranges < 1
if appeles < oranges {
    print("eat orange")
    oranges -= 1
} else {
    print("eat apple")
}

var question = true
let answerOne = "Swift"
let answerTwo = "Kotlin"

if question {
    answerOne
} else {
    answerTwo
}

question ? print(answerOne) : print(answerTwo)

//ternary conditional operator
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 :20)

//nil coalescing operator
let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

//Range operators
for index in 1...5 {
    print(index)
}

//half-open range
let names = ["Anna", "Alex", "Brain", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i) is called \(names[i])")
}

for name1 in names[2...] {
    print(name1)
}

for name1 in names[...2] {
    print(name1)
}

//logical operators
let allowedEntry = false
if !allowedEntry {
    print("Access Denied")
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome")
} else {
    print("Access Denied")
}

if enteredDoorCode || passedRetinaScan {
    print("Welcome")
} else {
    print("Access Denied")
}

let hasDoorKey = false
let knowsOverriedPassword = true

if (enteredDoorCode && passedRetinaScan) || (hasDoorKey || knowsOverriedPassword) {
    print("Welcome")
}

let someString = "Some string literal value"

let multilineString = ""

var emptyString = ""
var anotherEmptyString = String()

var variableString = "Horse"
variableString += " and dog"


for character in "Helle World" {
    print(character)
}

let characters: [Character] = ["H", "e", "l", "l", "o"]
let stringValue = String(characters)

//concart
let stringOne = "Hello"
let stringTwo = " there"
let concateString = stringOne + stringTwo

//interpoliation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

let greetingString = "Guten Tag!"
greetingString[greetingString.startIndex]

//inserting and remowing
var welcome = "Hello"
welcome.insert("!", at: welcome.endIndex)

//substring
let greetingTwo = "Hello, World!"
let index = greetingTwo.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greetingTwo[..<index]
let newString = String(beginning)

