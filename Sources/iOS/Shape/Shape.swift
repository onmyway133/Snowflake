import UIKit
import Reindeer

class Shape {
  var strokeColor: UIColor?
  let strokeWidth: CGFloat
  var fillColor: UIColor?
  var path: UIBezierPath?
  
  required init(attributes: JSONDictionary) {
    self.strokeWidth = attributes.number(key: "stroke-width") ?? 1
    self.fillColor = attributes.color(key: "fill")
    self.strokeColor = attributes.color(key: "stroke")
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
  
  var layer: CAShapeLayer {
    let layer = CAShapeLayer()
    layer.path = path?.cgPath
    
    layer.strokeColor = strokeColor?.cgColor
    layer.lineWidth = strokeWidth
    layer.fillColor = fillColor?.cgColor
    
    return layer
  }
}
