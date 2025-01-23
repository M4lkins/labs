import Foundation

func analyzeString(_ input: String) -> [Character: Int] {
    var characterCount: [Character: Int] = [:]
    
    for char in input {
        characterCount[char, default: 0] += 1
    }
    
    return characterCount
}

// Example usage:
let inputString = "hello world"
let result = analyzeString(inputString)

for (char, count) in result {
    print("\(char): \(count)")
}