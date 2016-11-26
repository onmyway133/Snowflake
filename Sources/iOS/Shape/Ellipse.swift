import UIKit
import Reindeer

class Ellipse: Shape {
  let center: CGPoint
  let radius: CGPoint
  
  required init(element: Element) {
    self.center = CGPoint(x: element.attributes.number(key: "cx") ?? 0,
                          y: element.attributes.number(key: "cy") ?? 0)
    self.radius = CGPoint(x: element.attributes.number(key: "rx") ?? 0,
                          y: element.attributes.number(key: "ry") ?? 0)
    
    super.init(element: element)
    
    self.path = UIBezierPath(ovalIn: rect)
  }
  
  var rect: CGRect {
    return CGRect(x: center.x - radius.x,
                  y: center.y - radius.y,
                  width: radius.x * 2,
                  height: radius.y * 2)
  }
}
