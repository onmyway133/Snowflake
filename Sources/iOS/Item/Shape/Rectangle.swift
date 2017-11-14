import UIKit
import Reindeers

public class Rectangle: Item, ShapeAware {

  public let frame: CGRect
  public let cornerRadius: CGPoint

  public required init(attributes: JSONDictionary) {
    self.frame = CGRect(x: attributes.number(key: "x") ?? 0,
                        y: attributes.number(key: "y") ?? 0,
                        width: attributes.number(key: "width") ?? 0,
                        height: attributes.number(key: "height") ?? 0)
    
    self.cornerRadius = CGPoint(x: attributes.number(key: "rx") ?? 0,
                                y: attributes.number(key: "ry") ?? 0)
    
    super.init(attributes: attributes)
  }

  public lazy var path: UIBezierPath = {
    if self.cornerRadius == CGPoint.zero {
      return UIBezierPath(rect: self.frame)
    } else {
      return UIBezierPath(roundedRect: self.frame,
                               byRoundingCorners: .allCorners,
                               cornerRadii: CGSize(width: self.cornerRadius.x, height: self.cornerRadius.y))
    }
  }()
}
