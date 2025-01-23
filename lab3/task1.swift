import Foundation

class Person {
    var name: String
    weak var child: Son?

    init(name: String) {
        self.name = name
        print("\(name) is initialized")
    }

    deinit {
        print("\(name) is deinitialized")
    }
}

class Son {
    var name: String
    weak var parent: Person?

    init(name: String) {
        self.name = name
        print("\(name) is initialized")
    }

    deinit {
        print("\(name) is deinitialized")
    }
}

// Step 4
var person: Person? = Person(name: "John")

// Step 6
do {
    let son = Son(name: "Mike")
    person?.child = son
    son.parent = person
}

// Step 9
person = nil