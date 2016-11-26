import UIKit
import Reindeer

class Circle: Shape {
  let center: CGPoint
  let radius: CGFloat
  
  required init(element: Element) {
    self.center = CGPoint(x: element.attributes.number(key: "cx") ?? 0,
                          y: element.attributes.number(key: "cy") ?? 0)
    self.radius = element.attributes.number(key: "r") ?? 0
    
    super.init(element: element)
    
    self.path = UIBezierPath(arcCenter: center, radius: radius,
                        startAngle: 0, endAngle: CGFloat.pi * CGFloat(2),
                        clockwise: true)
  }
}
