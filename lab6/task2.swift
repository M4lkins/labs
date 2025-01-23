import Foundation

// Опис структури Point
struct Point {
    let x: Double
    let y: Double
}

// Опис структури Figure
struct Figure {
    private let points: [Point]
    
    var type: FigureType {
        switch points.count {
        case 0: return .unknown
        case 1: return .point
        case 2: return .line
        case 3: return .triangle
        case 4: return .quadrilateral
        default: return .polygon
        }
    }
    
    init(points: [Point]) {
        self.points = points
    }
    
    init(_ points: Point...) {
        self.points = points
    }
    
    subscript(index: Int) -> Point? {
        guard index >= 0 && index < points.count else { return nil }
        return points[index]
    }
}

enum FigureType {
    case unknown
    case point
    case line
    case triangle
    case quadrilateral
    case polygon
}

// Приклад використання
let p1 = Point(x: 0, y: 0)
let p2 = Point(x: 1, y: 1)
let figure = Figure(p1, p2)

print("Figure type: \(figure.type)")  // Очікується: line
if let point = figure[1] {
    print("Second point: (x: \(point.x), y: \(point.y))")  // Очікується: (x: 1.0, y: 1.0)
}
