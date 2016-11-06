import UIKit

class Ellipse: Shape {
  let center: CGPoint
  let radius: CGPoint
  
  required init(attributes: JSONDictionary) {
    self.center = CGPoint(x: attributes.number(key: "cx") ?? 0,
                          y: attributes.number(key: "cy") ?? 0)
    self.radius = CGPoint(x: attributes.number(key: "rx") ?? 0,
                          y: attributes.number(key: "ry") ?? 0)
    
    super.init(attributes: attributes)
  }
}
