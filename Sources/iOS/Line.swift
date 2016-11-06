import UIKit

class Line: Shape {
  let point1: CGPoint
  let point2: CGPoint
  
  required init(attributes: JSONDictionary) {
    self.point1 = CGPoint(x: attributes.number(key: "x1"), y: attributes.number(key: "y1"))
    self.point2 = CGPoint(x: attributes.number(key: "x2"), y: attributes.number(key: "y2"))
    
    super.init(attributes: attributes)
    path = UIBezierPath()
    path?.move(to: point1)
    path?.addLine(to: point2)
  }
}
