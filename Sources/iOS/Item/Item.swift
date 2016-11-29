import UIKit
import Reindeer
import Reindeer

public class Item {
  public let id: String
  public let style: Style
  public var path: UIBezierPath?

  public required init(attributes: JSONDictionary) {
    self.id = attributes.string(key: "id") ?? ""
    self.style = Style(attributes: attributes)
  }
  
  static func make(element: Element) -> Item? {
    let mapping: [String: Item.Type] = [
      "path": Path.self,
      "circle": Circle.self,
      "line": Line.self,
      "polygon": Polygon.self,
      "polyline": Polyline.self,
      "rect": Rectangle.self,
      "ellipse": Ellipse.self,
      "text": Text.self,
      "image": Image.self
    ]

    var attributes = element.attributes
    attributes["name"] = element.name
    
    let shape = mapping[element.name ?? ""]
    return shape?.init(attributes: attributes)
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

    if let lineCap = style.lineCap {
      layer.lineCap = lineCap
    }

    if let lineJoin = style.lineJoin {
      layer.lineJoin = lineJoin
    }

    if let miterLimit = style.miterLimit {
      layer.miterLimit = miterLimit
    }
    
    return layer
  }
}
