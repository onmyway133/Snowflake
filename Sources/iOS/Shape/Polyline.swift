import UIKit
import Reindeer

class Polyline: Shape {
  let points: [CGPoint]
  
  required init(element: Element) {
    self.points = Utils.points(string: element.attributes.string(key: "points"))
    
    super.init(element: element)
    
    self.path = UIBezierPath()
    if let first = self.points.first {
      self.path?.move(to: first)
      
      self.points.dropFirst().forEach {
        self.path?.addLine(to: $0)
      }
    }
  }
}
