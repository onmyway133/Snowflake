import Foundation
import Reindeer

public class SVG {

  public let shapes: [Shape]
  public let size: CGSize

  public init(element: Element) {
    self.size = CGSize(width: element.attributes.number(key: "width") ?? 0,
                       height: element.attributes.number(key: "height") ?? 0)

    self.shapes = Group(element: element).shapes
  }

  public var layers: [CALayer] {
    return shapes.map {
      return $0.layer
    }
  }

  public var view: UIView {
    let view = UIView()

    layers.forEach { layer in
      view.layer.addSublayer(layer)
    }

    view.frame.size = size

    return view
  }
}
