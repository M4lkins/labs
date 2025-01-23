enum SortingAlgorithm {
    case bubble
    case selection
}

func sortArray(_ array: inout [Int], using algorithm: SortingAlgorithm = .bubble) {
    switch algorithm {
    case .bubble:
        bubbleSort(&array)
    case .selection:
        selectionSort(&array)
    }
}

private func bubbleSort(_ array: inout [Int]) {
    let n = array.count
    for i in 0..<n {
        for j in 0..<n-i-1 {
            if array[j] > array[j+1] {
                let temp = array[j]
                array[j] = array[j+1]
                array[j+1] = temp
            }
        }
    }
}

private func selectionSort(_ array: inout [Int]) {
    let n = array.count
    for i in 0..<n-1 {
        var minIndex = i
        for j in i+1..<n {
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        if minIndex != i {
            let temp = array[i]
            array[i] = array[minIndex]
            array[minIndex] = temp
        }
    }
}

// Example usage:
var numbers = [64, 25, 12, 22, 11]
sortArray(&numbers, using: .bubble)
print("Bubble Sorted: \(numbers)")

numbers = [64, 25, 12, 22, 11]
sortArray(&numbers, using: .selection)
print("Selection Sorted: \(numbers)")