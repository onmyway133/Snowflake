import UIKit
import Reindeer

public class Image: Item {

  public required init(attributes: JSONDictionary) {
    super.init(attributes: attributes)
  }

  public var layer: CALayer {
    let layer = CATextLayer()

    return layer
  }
}
