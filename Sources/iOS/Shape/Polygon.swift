import UIKit

class Polygon: Shape {
  var points: [CGPoint] = []
  
  required init(attributes: JSONDictionary) {
    let pairs: [String] = attributes.string(key: "points")?.components(separatedBy: " ") ?? []
    self.points = pairs.flatMap { pair in
      let components = pair.components(separatedBy: ",")
      if components.count == 2 {
        return CGPoint(x: CGFloat(string: components[0]),
                       y: CGFloat(string: components[1]))
      } else {
        return nil
      }
    }
    
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
