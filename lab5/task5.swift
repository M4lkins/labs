import Foundation

// Define the type for the operation function
typealias Operation = (Int, Int) -> Int

// Define the calculator function
func calculator(_ a: Int, _ b: Int, operation: Operation) -> Int {
    return operation(a, b)
}

// Define the operations
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func remainder(_ a: Int, _ b: Int) -> Int {
    return a % b
}

func power(_ a: Int, _ b: Int) -> Int {
    var result = 1
    for _ in 0..<b {
        result *= a
    }
    return result
}

// Define the menu function
func menu() {
    let a = 5
    let b = 3
    
    print("Select operation:")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Remainder")
    print("5. Power")
    
    guard let input = readLine(), let choice = Int(input) else {
        print("Invalid input")
        return
    }
    
    let result: Int
    switch choice {
    case 1:
        result = calculator(a, b, operation: add)
    case 2:
        result = calculator(a, b, operation: subtract)
    case 3:
        result = calculator(a, b, operation: multiply)
    case 4:
        result = calculator(a, b, operation: remainder)
    case 5:
        result = calculator(a, b, operation: power)
    default:
        print("Invalid choice")
        return
    }
    
    print("Result: \(result)")
}

// Call the menu function
menu()