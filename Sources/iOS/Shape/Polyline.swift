import UIKit

class Polyline: Shape {
  let points: [CGPoint]
  
  required init(attributes: JSONDictionary) {
    self.points = Polyline.parse(string: attributes.string(key: "points"))
    
    super.init(attributes: attributes)
    
    self.path = UIBezierPath()
    if let first = self.points.first {
      self.path?.move(to: first)
      
      self.points.dropFirst().forEach {
        self.path?.addLine(to: $0)
      }
    }
  }
  
  static func parse(string: String?) -> [CGPoint] {
    let pairs: [String] = string?.components(separatedBy: " ") ?? []
    return pairs.flatMap { pair in
      let components = pair.components(separatedBy: ",")
      if components.count == 2 {
        return CGPoint(x: Utils.number(string: components[0]),
                       y: Utils.number(string: components[1]))
      } else {
        return nil
      }
    }
  }
}
