import UIKit

class Rectangle: Shape {
  let frame: CGRect
  let cornerRadius: CGPoint

  required init(attributes: JSONDictionary) {
    self.frame = CGRect(x: attributes.number(key: "x") ?? 0,
                        y: attributes.number(key: "y") ?? 0,
                        width: attributes.number(key: "width") ?? 0,
                        height: attributes.number(key: "height") ?? 0)
    
    self.cornerRadius = CGPoint(x: attributes.number(key: "rx") ?? 0,
                                y: attributes.number(key: "ry") ?? 0)
    
    super.init(attributes: attributes)
    
    if cornerRadius == CGPoint.zero {
      self.path = UIBezierPath(rect: frame)
    } else {
      self.path = UIBezierPath(roundedRect: frame,
                               byRoundingCorners: .allCorners,
                               cornerRadii: CGSize(width: cornerRadius.x, height: cornerRadius.y))
    }
  }
}
