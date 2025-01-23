import Foundation

var str = "Hello World. This is Swift programming language"


print("Length of the string: \(str.count)")


str = str.replacingOccurrences(of: "i", with: "u")
print("After replacing 'i' with 'u': \(str)")


var indicesToRemove = [3, 6, 9]
str = String(str.enumerated().filter { !indicesToRemove.contains($0.offset) }.map { $0.element })
print("After removing 4th, 7th, and 10th characters: \(str)")


str += " (modified)"
print("After adding '(modified)': \(str)")


print("Is the string empty? \(str.isEmpty)")


str += "."
print("After adding '.': \(str)")


print("Does the string start with 'Hello'? \(str.hasPrefix("Hello"))")


print("Does the string end with 'world.'? \(str.hasSuffix("world."))")


let index = str.index(str.startIndex, offsetBy: 10)
str.insert("-", at: index)
print("After inserting '-' after 10th character: \(str)")


str = str.replacingOccurrences(of: "Thus us", with: "It is")
print("After replacing 'Thus us' with 'It is': \(str)")


let tenthChar = str[str.index(str.startIndex, offsetBy: 9)]
let fifteenthChar = str[str.index(str.startIndex, offsetBy: 14)]
print("10th character: \(tenthChar), 15th character: \(fifteenthChar)")


let startIndex = str.index(str.startIndex, offsetBy: 9)
let endIndex = str.index(str.startIndex, offsetBy: 14)
let substring = str[startIndex..<endIndex]
print("Substring from 10th to 15th character: \(substring)")