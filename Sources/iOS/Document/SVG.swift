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

  func view(size: CGSize) -> UIView {
    let view = UIView()
    view.frame.size = size

    for layer in layers(size: size) {
      view.layer.addSublayer(layer)
    }

    return view
  }

  func layers(size: CGSize) -> [CALayer] {
    var layers = [CALayer]()
    let ratio = Utils.ratio(from: bounds().size, to: size)

    for item in items {
      if let item = item as? ShapeAware {
        let layer = item.layer()

        if let cgPath = layer.path {
          let path = UIBezierPath(cgPath: cgPath)
          path.apply(CGAffineTransform(scaleX: ratio, y: ratio))

          layer.path = path.cgPath
        }

        layers.append(layer)
      }
    }

    return layers
  }
}
