import UIKit

class Circle: Shape {
  let center: CGPoint
  let radius: CGFloat
  
  required init(attributes: JSONDictionary) {
    self.center = CGPoint(x: attributes.number(key: "cx") ?? 0,
                          y: attributes.number(key: "cy") ?? 0)
    self.radius = attributes.number(key: "r") ?? 0
    
    super.init(attributes: attributes)
    
    path = UIBezierPath(arcCenter: center, radius: radius,
                        startAngle: 0, endAngle: CGFloat.pi * CGFloat(2),
                        clockwise: true)
  }
}
