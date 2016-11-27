import UIKit
import Reindeer

public class Rectangle: Shape {
  public let frame: CGRect
  public let cornerRadius: CGPoint

  public required init(element: Element) {
    self.frame = CGRect(x: element.attributes.number(key: "x") ?? 0,
                        y: element.attributes.number(key: "y") ?? 0,
                        width: element.attributes.number(key: "width") ?? 0,
                        height: element.attributes.number(key: "height") ?? 0)
    
    self.cornerRadius = CGPoint(x: element.attributes.number(key: "rx") ?? 0,
                                y: element.attributes.number(key: "ry") ?? 0)
    
    super.init(element: element)
    
    if cornerRadius == CGPoint.zero {
      self.path = UIBezierPath(rect: frame)
    } else {
      self.path = UIBezierPath(roundedRect: frame,
                               byRoundingCorners: .allCorners,
                               cornerRadii: CGSize(width: cornerRadius.x, height: cornerRadius.y))
    }
  }
}
