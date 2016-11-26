import Foundation
import Reindeer

public class Group {

  public let shapes: [Shape]

  public init(element: Element) {
    var shapes: [Shape] = []

    element.children().forEach {
      if $0.name == "g" {
        shapes.append(contentsOf: Group(element: $0).shapes)
      } else if let shape = Shape.make(element: $0) {
        shapes.append(shape)
      }
    }

    self.shapes = shapes
  }
}
