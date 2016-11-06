import UIKit
import Reindeer

class Shape {
  var path: UIBezierPath?
  let style: Style
  
  required init(attributes: JSONDictionary) {
    self.style = Style(attributes: attributes)
  }
  
  static func make(element: Element) -> Shape? {
    let mapping: [String: Shape.Type] = [
      "path": PathShape.self,
      "circle": Circle.self,
      "line": Line.self,
      "polygon": Polygon.self,
      "polyline": Polyline.self,
      "rect": Rectangle.self,
      "ellipse": Ellipse.self
    ]
    
    let shape = mapping[element.name ?? ""]
    return shape?.init(attributes: element.attributes)
  }
  
  var layer: CAShapeLayer {
    let layer = CAShapeLayer()
    layer.path = path?.cgPath
    
    layer.strokeColor = style.strokeColor?.cgColor
    layer.lineWidth = style.strokeWidth
    layer.fillColor = style.fillColor?.cgColor
    layer.opacity = Float(style.opacity)
    
    return layer
  }
}
