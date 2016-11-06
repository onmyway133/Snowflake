import UIKit
import Reindeer

class Shape {
  var strokeColor: UIColor?
  var strokeWidth: CGFloat?
  var fillColor: UIColor?
  var path: UIBezierPath?
  
  required init(attributes: JSONDictionary) {
    
  }
  
  static func make(element: Element) -> Shape? {
    let mapping: [String: Shape.Type] = [
      "path": PathShape.self,
      "circle": Circle.self,
      "line": Line.self,
      "polygon": Polygon.self,
      "polyline": Polyline.self,
      "rectangle": Rectangle.self
    ]
    
    let shape = mapping[element.name ?? ""]
    return shape?.init(attributes: element.attributes)
  }
}
