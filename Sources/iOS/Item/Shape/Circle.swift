import UIKit
import Reindeers

public class Circle: Item, ShapeAware {

  public let center: CGPoint
  public let radius: CGFloat
  
  required public init(attributes: JSONDictionary) {
    self.center = CGPoint(x: attributes.number(key: "cx") ?? 0,
                          y: attributes.number(key: "cy") ?? 0)
    self.radius = attributes.number(key: "r") ?? 0

    super.init(attributes: attributes)
  }

  public lazy var path: UIBezierPath = {
    return UIBezierPath(arcCenter: self.center, radius: self.radius,
                        startAngle: 0, endAngle: CGFloat.pi * CGFloat(2),
                        clockwise: true)
  }()
}
