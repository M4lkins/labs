import Foundation

// 1. Опишіть множину chSet із символів а, b, c та d.
let chSet: Set<Character> = ["a", "b", "c", "d"]

// 2. Створіть mutable множину mChSet на основі множити chSet.
var mChSet = chSet

// 3. Виведіть на екран кількість елементів множини mChSet.
print("Кількість елементів у mChSet: \(mChSet.count)")

// 4. Вставте символ е в множину mChSet.
mChSet.insert("e")

// 5. Створіть множину srtChSet, яка є відсортованою версією множини mChSet.
let srtChSet = mChSet.sorted()
print("Відсортована множина srtChSet: \(srtChSet)")

// 6. Видаліть з множини mChSet символ f та виведіть видалений символ на екран.
if let removedElement = mChSet.remove("f") {
    print("Видалений символ: \(removedElement)")
} else {
    print("Символ 'f' не знайдено у множині mChSet")
}

// 7. Видаліть символ d з множини mChSet за його індексом та виведіть рядкове представлення множини mChSet.
if let index = mChSet.firstIndex(of: "d") {
    mChSet.remove(at: index)
}
print("Множина mChSet після видалення символу 'd': \(mChSet)")

// 8. Виведіть відстань у множині mChSet між першим елементом та символом а.
if let firstElement = mChSet.first, let distance = mChSet.distance(from: mChSet.startIndex, to: mChSet.firstIndex(of: "a") ?? mChSet.startIndex) {
    print("Відстань між першим елементом та символом 'a': \(distance)")
}

// 9. Вставте символ а в множину mChSet.
mChSet.insert("a")

// 10. Опишіть множини aSet (зі значеннями One, Two, Three, 1, 2) та bSet (зі значеннями 1, 2, 3, One, Two).
let aSet: Set<AnyHashable> = ["One", "Two", "Three", 1, 2]
let bSet: Set<AnyHashable> = [1, 2, 3, "One", "Two"]

// 11. Створіть множину, яка містить всі спільні елементи для множин aSet та bSet.
let commonSet = aSet.intersection(bSet)
print("Спільні елементи для aSet та bSet: \(commonSet)")

// 12. Створіть множину, яка містить унікальні елементи у множині aSet по відношенню до множини bSet.
let uniqueASet = aSet.subtracting(bSet)
print("Унікальні елементи у aSet по відношенню до bSet: \(uniqueASet)")

// Створіть множину, яка містить унікальні елементи у множині bSet по відношенню до множини aSet.
let uniqueBSet = bSet.subtracting(aSet)
print("Унікальні елементи у bSet по відношенню до aSet: \(uniqueBSet)")

// 13. Створіть множину, яка містить елементи, які не є спільними для множин aSet та bSet.
let symmetricDifferenceSet = aSet.symmetricDifference(bSet)
print("Елементи, які не є спільними для aSet та bSet: \(symmetricDifferenceSet)")

// 14. Створіть множину, яка об'єднує усі елементи множин aSet та bSet.
let unionSet = aSet.union(bSet)
print("Об'єднані елементи множин aSet та bSet: \(unionSet)")

// 15. Опишіть множини xSet (зі значеннями 2...4), ySet (зі значеннями 1...6), zSet (зі значеннями 3, 4, 2) та x1Set (зі значеннями 5, 6, 7).
let xSet: Set<Int> = [2, 3, 4]
let ySet: Set<Int> = [1, 2, 3, 4, 5, 6]
let zSet: Set<Int> = [2, 3, 4]
let x1Set: Set<Int> = [5, 6, 7]

// 16. Виведіть значення, які визначають чи множина xSet входить у множину ySet, а також чи множина ySet входить у множину xSet.
print("Чи входить xSet у ySet: \(xSet.isSubset(of: ySet))")
print("Чи входить ySet у xSet: \(ySet.isSubset(of: xSet))")

// 17. Виведіть значення, які визначають чи множина xSet містить множину ySet, а також чи множина ySet містить множину xSet.
print("Чи містить xSet множину ySet: \(xSet.isSuperset(of: ySet))")
print("Чи містить ySet множину xSet: \(ySet.isSuperset(of: xSet))")

// 18. Виведіть значеня, яке визначає чи множини xSet та zSet є рівними.
print("Чи рівні множини xSet та zSet: \(xSet == zSet)")

// 19. Виведіть значення, яке визначає чи множина xSet входить у множину zSet, але не є рівною множині zSet.
print("Чи входить xSet у zSet, але не є рівною: \(xSet.isStrictSubset(of: zSet))")

// 20. Виведіть значення, яке визначає чи множина xSet містить множину zSet, але не є рівною множині zSet.
print("Чи містить xSet множину zSet, але не є рівною: \(xSet.isStrictSuperset(of: zSet))")