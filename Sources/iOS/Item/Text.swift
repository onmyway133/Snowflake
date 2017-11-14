import UIKit
import Reindeers

public class Text: Item {
  public let point: CGPoint
  public let text: String

  public required init(attributes: JSONDictionary) {
    self.point = CGPoint(x: attributes.number(key: "x") ?? 0,
                          y: attributes.number(key: "y") ?? 0)
    self.text = attributes.string(key: "name") ?? ""

    super.init(attributes: attributes)
  }

  public func layer() -> CALayer {
    let layer = CATextLayer()
    layer.string = text
    layer.position = point

    return layer
  }
}
