// 1.
var integerNumber: Int?

// 2.
var decimalNumber: Double?

// 3.
integerNumber = 10

// 4.
if let number = integerNumber {
    integerNumber = number + number
}

// 5.
if let number = integerNumber {
    integerNumber = -number
}

// 6.
if let number = integerNumber {
    decimalNumber = Double(number)
}

// 7.
var pairOrValues: (Int?, Double?)

// 8.
pairOrValues = (integerNumber, decimalNumber)
if let intValue = pairOrValues.0 {
    print("Integer value: \(intValue)")
}

// 9.
if let doubleValue = pairOrValues.1 {
    print("Decimal value: \(doubleValue)")
}

// 10.
if let decimalValue = decimalNumber {
    print("Decimal number: \(decimalValue)")
}