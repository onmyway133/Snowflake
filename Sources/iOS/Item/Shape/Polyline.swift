import UIKit
import Reindeers

public class Polyline: Item, ShapeAware {

  public let points: [CGPoint]
  
  public required init(attributes: JSONDictionary) {
    self.points = Utils.points(string: attributes.string(key: "points"))
    
    super.init(attributes: attributes)
  }

  public lazy var path: UIBezierPath = {
    let path = UIBezierPath()
    if let first = self.points.first {
      path.move(to: first)

      self.points.dropFirst().forEach {
        path.addLine(to: $0)
      }
    }

    return path
  }()
}
