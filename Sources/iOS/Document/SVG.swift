import Foundation
import Reindeer

public class SVG {

  public let groups: [Group]
  public let size: CGSize

  public init(element: Element) {
    // Size
    self.size = CGSize(width: element.attributes.number(key: "width") ?? 0,
                       height: element.attributes.number(key: "height") ?? 0)

    // Group
    var groups: [Group] = []
    var shapes: [Shape] = []

    element.children().forEach {
      if $0.name == "g" {
        groups.append(Group(element: $0))
      } else if let shape = Shape.make(element: $0) {
        shapes.append(shape)
      }
    }

    if !shapes.isEmpty {
      groups.append(Group(shapes: shapes))
    }

    self.groups = groups
  }

  public var layers: [CAShapeLayer] {
    var layers = [CAShapeLayer]()

    groups.forEach { group in
      layers.append(contentsOf: group.layers)
    }

    return layers
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
