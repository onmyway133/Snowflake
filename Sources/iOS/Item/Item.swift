import UIKit
import Reindeers

public class Item {
  public let id: String
  public let style: Style

  public required init(attributes: JSONDictionary) {
    self.id = attributes.string(key: "id") ?? ""
    self.style = Style(attributes: attributes)
  }

  // MARK: - Helper

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
}
