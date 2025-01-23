import Foundation

func analyzeCharacter(_ character: Character) {
    let isLetter = character.isLetter
    let isDigit = character.isNumber
    let isUppercase = character.isUppercase
    let isLowercase = character.isLowercase
    
    var alphabet: String = "unknown"
    if let scalar = character.unicodeScalars.first {
        if CharacterSet(charactersIn: "A"..."Z").contains(scalar) || CharacterSet(charactersIn: "a"..."z").contains(scalar) {
            alphabet = "English"
        } else if CharacterSet(charactersIn: "А"..."Я").contains(scalar) || CharacterSet(charactersIn: "а"..."я").contains(scalar) {
            alphabet = "Ukrainian"
        }
    }
    
    print("Character: \(character)")
    print("Is letter: \(isLetter)")
    print("Is digit: \(isDigit)")
    print("Alphabet: \(alphabet)")
    print("Is uppercase: \(isUppercase)")
    print("Is lowercase: \(isLowercase)")
}

// Example usage:
analyzeCharacter("A")
analyzeCharacter("я")
analyzeCharacter("1")
analyzeCharacter("b")