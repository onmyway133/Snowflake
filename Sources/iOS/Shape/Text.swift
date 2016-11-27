import UIKit
import Reindeer

public class Text: Shape {
  public let point: CGPoint
  public let text: String

  public required init(element: Element) {
    self.point = CGPoint(x: element.attributes.number(key: "x") ?? 0,
                          y: element.attributes.number(key: "y") ?? 0)
    self.text = element.content ?? ""

    super.init(element: element)
  }

  public override var layer: CALayer {
    let layer = CATextLayer()
    layer.string = text
    layer.position = point

    return layer
  }
}
