import UIKit
import Reindeer

class Text: Shape {
  let point: CGPoint
  let text: String

  required init(element: Element) {
    self.point = CGPoint(x: element.attributes.number(key: "x") ?? 0,
                          y: element.attributes.number(key: "y") ?? 0)
    self.text = element.content ?? ""

    super.init(element: element)
  }

  override var layer: CALayer {
    let layer = CATextLayer()
    layer.string = text

    return layer
  }
}
