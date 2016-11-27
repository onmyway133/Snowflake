import UIKit
import Reindeer

class Image: Shape {

  required init(element: Element) {
    super.init(element: element)
  }

  override var layer: CALayer {
    let layer = CATextLayer()

    return layer
  }
}
