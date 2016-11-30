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
    let layers: [CALayer] =  items.flatMap({ item in
      if let item = item as? ShapeAware {
        return item.layer()
      } else if let item = item as? Text {
        return item.layer()
      } else if let item = item as? Image {
        return item.layer()
      } else {
        return nil
      }
    })

    for layer in layers {
      if let layer = layer as? CAShapeLayer, let cgPath = layer.path {
        let ratio = Utils.ratio(from: bounds().size, to: size)

        let path = UIBezierPath(cgPath: cgPath)
        path.apply(CGAffineTransform(scaleX: ratio, y: ratio))

        layer.path = path.cgPath
      }
    }

    return layers
  }
}
