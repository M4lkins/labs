func factorial(_ n: Int) -> Int {
    if n == 0 {
        return 1
    } else {
        return n * factorial(n - 1)
    }
}

// Приклад використання функції
let number = 5
let result = factorial(number)
print("Факторіал числа \(number) дорівнює \(result)")