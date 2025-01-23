import Foundation

// Частина 1

// 1. Створити обєкт Operand з властивістю number
// 2. Додати в обєкт властивість типу operand: Operand?
class Operand {
    var number: Int
    var operand: Operand?

    init(number: Int) {
        self.number = number
    }
}

// 3. Створити closure для обчислення суми 2-х чисел з кількох Operand обєктів
let sumClosure: (Operand, Operand) -> Int = { op1, op2 in
    return op1.number + op2.number
}

// 4. Написати код який створить retainCycle
var op1: Operand? = Operand(number: 5)
var op2: Operand? = Operand(number: 10)
op1?.operand = op2
op2?.operand = op1

// 5. Написати код який вирішує проблему з попереднього пункту
op1 = nil
op2 = nil

// Частина 2

// 1. Додати в клас Operand closure як властивість, яка робить якусь операцію (без параметрів). Виконати цей блок і init.
class OperandWithClosure {
    var number: Int
    var operand: OperandWithClosure?
    var aBlock: (() -> ())? = nil

    init(number: Int) {
        self.number = number
        print("init")
        aBlock = { [weak self] in
            print(self?.number ?? 0)
        }
    }

    deinit {
        print("deinit")
    }
}

// 2. Створити обєект типу Operand і відразу занілити його
var opWithClosure: OperandWithClosure? = OperandWithClosure(number: 20)
opWithClosure = nil

// 3. Перевірити логи (deinit не викликається)
// 4. Модифікувати код з використанням weak / unowned в capture list для вирішення даної проблеми
// (вже зроблено в init методі класу OperandWithClosure)
