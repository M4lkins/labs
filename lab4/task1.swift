import Foundation

class Rational: CustomStringConvertible, Comparable, NSCopying {
    var numerator: Int
    var denominator: Int
    
    init(_ numerator: Int, _ denominator: Int) {
        precondition(denominator != 0, "Denominator cannot be zero")
        let sign = denominator < 0 ? -1 : 1
        self.numerator = numerator * sign
        self.denominator = abs(denominator)
        simplify()
    }
    
    private func simplify() {
        let gcd = Rational.gcd(abs(numerator), denominator)
        numerator /= gcd
        denominator /= gcd
    }
    
    private static func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
    
    static func +(lhs: Rational, rhs: Rational) -> Rational {
        return Rational(lhs.numerator * rhs.denominator + rhs.numerator * lhs.denominator, lhs.denominator * rhs.denominator)
    }
    
    static func -(lhs: Rational, rhs: Rational) -> Rational {
        return Rational(lhs.numerator * rhs.denominator - rhs.numerator * lhs.denominator, lhs.denominator * rhs.denominator)
    }
    
    static func <(lhs: Rational, rhs: Rational) -> Bool {
        return lhs.numerator * rhs.denominator < rhs.numerator * lhs.denominator
    }
    
    static func ==(lhs: Rational, rhs: Rational) -> Bool {
        return lhs.numerator == rhs.numerator && lhs.denominator == rhs.denominator
    }
    
    var description: String {
        return "\(numerator)/\(denominator)"
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Rational(numerator, denominator)
    }
}

class Calculator {
    static let shared = Calculator()
    
    private init() {}

    func multiply(_ lhs: Rational, _ rhs: Rational) -> Rational {
        return Rational(lhs.numerator * rhs.numerator, lhs.denominator * rhs.denominator)
    }
    
    func divide(_ lhs: Rational, _ rhs: Rational) -> Rational {
        precondition(rhs.numerator != 0, "Cannot divide by zero")
        return Rational(lhs.numerator * rhs.denominator, lhs.denominator * rhs.numerator)
    }

    func evaluate(_ expression: [Any]) -> Rational {
        var stack: [Any] = []

        // Перша обробка: множення і ділення
        var i = 0
        while i < expression.count {
            if let op = expression[i] as? String, (op == "*" || op == "/") {
                guard let lhs = stack.popLast() as? Rational,
                      let rhs = expression[i + 1] as? Rational else {
                    fatalError("Invalid expression")
                }
                let result = (op == "*") ? multiply(lhs, rhs) : divide(lhs, rhs)
                stack.append(result)
                i += 1
            } else {
                stack.append(expression[i])
            }
            i += 1
        }

        // Друга обробка: додавання і віднімання
        var result = stack[0] as! Rational
        i = 1
        while i < stack.count {
            if let op = stack[i] as? String {
                guard let rhs = stack[i + 1] as? Rational else {
                    fatalError("Invalid expression")
                }
                result = (op == "+") ? (result + rhs) : (result - rhs)
                i += 1
            }
            i += 1
        }

        return result
    }
}

// Демонстрація
let rational1 = Rational(1, 2)
let rational2 = Rational(3, 4)
let rational3 = Rational(2, 5)

// Вираз: 1/2 + 3/4 * 2/5 - 1/2
let expression: [Any] = [rational1, "+", rational2, "*", rational3, "-", rational1]
let result = Calculator.shared.evaluate(expression)

print("Result: \(result)")
