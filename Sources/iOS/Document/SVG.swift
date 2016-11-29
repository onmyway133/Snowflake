import Foundation
import Reindeer

public class SVG {

  public let items: [Item]
  public let size: CGSize

  public init(element: Element) {
    self.size = CGSize(width: element.attributes.number(key: "width") ?? 0,
                       height: element.attributes.number(key: "height") ?? 0)

    self.items = Group(element: element).items
  }

  public var layers: [CALayer] {
    return []
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

public extension SVG {

  func bounds() -> CGRect {
    var rect = CGRect.zero

    items.forEach { item in
      if let item = item as? ShapeAware {
        rect = item.path.bounds.union(rect)
      }
    }

    return rect
  }

  func layers(size: CGSize) -> [CALayer] {
    return []
  }
}
