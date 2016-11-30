import UIKit
import Reindeer

public class Image: Item {

  public required init(attributes: JSONDictionary) {
    super.init(attributes: attributes)
  }

  public func layer() -> CALayer {
    let layer = CALayer()

    return layer
  }
}
