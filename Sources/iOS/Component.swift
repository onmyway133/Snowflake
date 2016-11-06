import Foundation
import Reindeer

class Component {
  
  let shapes: [Shape]
  
  init(element: Element) {
    shapes = element.children().flatMap {
      return Shape.make(element: $0)
    }
  }
}
