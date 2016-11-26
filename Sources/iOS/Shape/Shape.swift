import UIKit
import Reindeer
import Reindeer

public class Shape {
  let id: String
  let style: Style
  var path: UIBezierPath?

  public required init(element: Element) {
    self.id = element.attributes.string(key: "id") ?? ""
    self.style = Style(attributes: element.attributes)
  }
  
  static func make(element: Element) -> Shape? {
    let mapping: [String: Shape.Type] = [
      "path": PathShape.self,
      "circle": Circle.self,
      "line": Line.self,
      "polygon": Polygon.self,
      "polyline": Polyline.self,
      "rect": Rectangle.self,
      "ellipse": Ellipse.self,
      "text": Text.self
    ]
    
    let shape = mapping[element.name ?? ""]
    return shape?.init(element: element)
  }
  
  // MARK: Layer
  
  var layer: CALayer {
    let layer = CAShapeLayer()
    layer.path = path?.cgPath
    
    layer.strokeColor = style.strokeColor?.cgColor
    layer.lineWidth = style.strokeWidth
    layer.fillColor = style.fillColor?.cgColor
    layer.opacity = Float(style.opacity)
    
    if let fillRule = style.fillRule {
      layer.fillRule = fillRule
    }
    
    return layer
  }
}
