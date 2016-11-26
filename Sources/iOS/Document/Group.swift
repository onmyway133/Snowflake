import Foundation
import Reindeer

public class Group {

  public let shapes: [Shape]
  public let id: String

  public init(shapes: [Shape]) {
    self.id = ""
    self.shapes = shapes
  }

  public init(element: Element) {
    self.id = element.attributes.string(key: "id") ?? ""

    self.shapes = element.children().flatMap {
      return Shape.make(element: $0)
    }
  }

  public var layers: [CALayer] {
    return shapes.map { shape in
      return shape.layer
    }
  }
}
