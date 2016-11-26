import UIKit
import Reindeer

class Line: Shape {
  let point1: CGPoint
  let point2: CGPoint
  
  required init(element: Element) {
    self.point1 = CGPoint(x: element.attributes.number(key: "x1") ?? 0,
                          y: element.attributes.number(key: "y1") ?? 0)
    self.point2 = CGPoint(x: element.attributes.number(key: "x2") ?? 0,
                          y: element.attributes.number(key: "y2") ?? 0)
    
    super.init(element: element)
    
    self.path = UIBezierPath()
    self.path?.move(to: point1)
    self.path?.addLine(to: point2)
  }
}
