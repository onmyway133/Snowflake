import UIKit
import Reindeers

public class Line: Item, ShapeAware {

  public let point1: CGPoint
  public let point2: CGPoint
  
  public required init(attributes: JSONDictionary) {
    self.point1 = CGPoint(x: attributes.number(key: "x1") ?? 0,
                          y: attributes.number(key: "y1") ?? 0)
    self.point2 = CGPoint(x: attributes.number(key: "x2") ?? 0,
                          y: attributes.number(key: "y2") ?? 0)
    
    super.init(attributes: attributes)
  }

  public lazy var path: UIBezierPath = {
    let path = UIBezierPath()
    path.move(to: self.point1)
    path.addLine(to: self.point2)

    return path
  }()
}
