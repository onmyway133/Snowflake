import UIKit
import Reindeer

public class Image: Shape {

  public required init(element: Element) {
    super.init(element: element)
  }

  public override var layer: CALayer {
    let layer = CATextLayer()

    return layer
  }
}
