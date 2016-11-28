import UIKit
import Reindeer

public class Polyline: Shape {
  public let points: [CGPoint]
  
  public required init(attributes: JSONDictionary) {
    self.points = Utils.points(string: attributes.string(key: "points"))
    
    super.init(attributes: attributes)
    
    self.path = UIBezierPath()
    if let first = self.points.first {
      self.path?.move(to: first)
      
      self.points.dropFirst().forEach {
        self.path?.addLine(to: $0)
      }
    }
  }
}
