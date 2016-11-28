import UIKit
import Reindeer

public class Line: Shape {
  public let point1: CGPoint
  public let point2: CGPoint
  
  public required init(attributes: JSONDictionary) {
    self.point1 = CGPoint(x: attributes.number(key: "x1") ?? 0,
                          y: attributes.number(key: "y1") ?? 0)
    self.point2 = CGPoint(x: attributes.number(key: "x2") ?? 0,
                          y: attributes.number(key: "y2") ?? 0)
    
    super.init(attributes: attributes)
    
    self.path = UIBezierPath()
    self.path?.move(to: point1)
    self.path?.addLine(to: point2)
  }
}
