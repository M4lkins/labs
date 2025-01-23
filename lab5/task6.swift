import Foundation

func largestCircleContainingPoint(circles: [(center: (x: Double, y: Double), radius: Double)], point: (x: Double, y: Double)) -> (center: (x: Double, y: Double), radius: Double)? {
    var largestCircle: (center: (x: Double, y: Double), radius: Double)? = nil
    
    for circle in circles {
        let distance = sqrt(pow(circle.center.x - point.x, 2) + pow(circle.center.y - point.y, 2))
        if distance <= circle.radius {
            if largestCircle == nil || circle.radius > largestCircle!.radius {
                largestCircle = circle
            }
        }
    }
    
    return largestCircle
}

// Example usage:
let circles: [(center: (x: Double, y: Double), radius: Double)] = [((0, 0), 5), ((1, 1), 3), ((-2, -2), 4)]
let point = (x: 1.0, y: 1.0)
if let largestCircle = largestCircleContainingPoint(circles: circles, point: point) {
    print("The largest circle containing the point is centered at (\(largestCircle.center.x), \(largestCircle.center.y)) with radius \(largestCircle.radius)")
} else {
    print("No circle contains the point.")
}