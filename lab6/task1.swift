import Foundation

struct Point {
    private let cartesian: CartesianPoint
    private let polar: PolarPoint
    
    init(x: Double = 0.0, y: Double = 0.0) {
        self.cartesian = CartesianPoint(x: x, y: y)
        self.polar = PolarPoint(radius: hypot(x, y), angle: atan2(y, x))
    }
    
    init(radius: Double = 0.0, angle: Double = 0.0) {
        self.polar = PolarPoint(radius: radius, angle: angle)
        self.cartesian = CartesianPoint(x: radius * cos(angle), y: radius * sin(angle))
    }
    
    func moveBy(x: Double, y: Double) -> Point {
        return Point(x: cartesian.x + x, y: cartesian.y + y)
    }
    
    func moveBy(radius: Double, angle: Double) -> Point {
        let newX = cartesian.x + radius * cos(angle)
        let newY = cartesian.y + radius * sin(angle)
        return Point(x: newX, y: newY)
    }
    
    func description(in system: CoordinateSystem = .cartesian) -> String {
        switch system {
        case .cartesian:
            return "(x: \(cartesian.x), y: \(cartesian.y))"
        case .polar:
            return "(radius: \(polar.radius), angle: \(polar.angle))"
        }
    }
}

struct CartesianPoint {
    let x: Double
    let y: Double
}

struct PolarPoint {
    let radius: Double
    let angle: Double
}

enum CoordinateSystem {
    case cartesian
    case polar
}

// Тестування функціональності
let point1 = Point(x: 3.0, y: 4.0)
print(point1.description()) // Очікується: (x: 3.0, y: 4.0)
print(point1.description(in: .polar)) // Очікується: (radius: 5.0, angle: 0.93...)

let movedPoint = point1.moveBy(x: 2.0, y: 1.0)
print(movedPoint.description()) // Очікується: (x: 5.0, y: 5.0)

let polarMovedPoint = point1.moveBy(radius: 1.0, angle: .pi / 4)
print(polarMovedPoint.description()) // Виведе нову позицію в декартових координатах
