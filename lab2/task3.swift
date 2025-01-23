import Foundation

// 1. Опишіть словник nDict
let nDict: [String: String] = [
    "1": "One",
    "2": "Two",
    "3": "Three",
    "4": "Four",
    "5": "Five"
]

// 2. Виведіть на екран значення масиву nDict за ключем 3
if let valueForKey3 = nDict["3"] {
    print("Value for key 3: \(valueForKey3)")
}

// 3. Виведіть на екран значення масиву nDict за індексом ключа 4
let keys = Array(nDict.keys)
if keys.indices.contains(3) {
    let keyAtIndex4 = keys[3]
    if let valueAtIndex4 = nDict[keyAtIndex4] {
        print("Value at index 4: \(valueAtIndex4)")
    }
}

// 4. Створіть mutable словник mNDict на основі словника nDict
var mNDict = nDict

// 5. Додайте елементи 6:Seven та 7:Six до словника mNDict
mNDict["6"] = "Seven"
mNDict["7"] = "Six"

// 6. Оновіть значення елементів словника mNDict, не використовуючи subscript []
mNDict.updateValue("Six", forKey: "6")
mNDict.updateValue("Seven", forKey: "7")
mNDict.updateValue("Eight", forKey: "8")

// 7. Видаліть елемент за ключем 5 зі словника mNDict
mNDict.removeValue(forKey: "5")

// 8. Видаліть елемент за індексом ключа 4 зі словника mNDict
if keys.indices.contains(3) {
    let keyAtIndex4 = keys[3]
    mNDict.removeValue(forKey: keyAtIndex4)
}

// 9. Визначіть та виведіть на екран відстань у словнику mNDict між парами значень 1:One та 7:Seven
if let index1 = mNDict.keys.firstIndex(of: "1"), let index7 = mNDict.keys.firstIndex(of: "7") {
    let distance = mNDict.distance(from: index1, to: index7)
    print("Distance between 1:One and 7:Seven: \(distance)")
}

// 10. Створіть масив mNDictKeys, елементами якого є усі ключі словника mNDict
let mNDictKeys = Array(mNDict.keys)
print("Keys: \(mNDictKeys)")

// 11. Створіть масив mNDictValues, елементами якого є усі значення словника mNDict
let mNDictValues = Array(mNDict.values)
print("Values: \(mNDictValues)")

// 12. Виведіть на екран кількість елементів словника mNDict, а також кількість його всіх ключів та його всіх значень
print("Number of elements in mNDict: \(mNDict.count)")
print("Number of keys in mNDict: \(mNDictKeys.count)")
print("Number of values in mNDict: \(mNDictValues.count)")

// 13. Виведіть на екран рядкове представлення словника mNDict
print("String representation of mNDict: \(mNDict)")