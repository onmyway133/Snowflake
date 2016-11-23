import UIKit

class Polygon: Shape {
  var points: [CGPoint] = []
  
  required init(attributes: JSONDictionary) {
    self.points = Utils.points(string: attributes.string(key: "points"))
    
    super.init(attributes: attributes)
    
    self.path = UIBezierPath()
    if let first = self.points.first {
      self.path?.move(to: first)
      
      self.points.dropFirst().forEach {
        self.path?.addLine(to: $0)
      }
      
      self.path?.close()
    }
  }
}
