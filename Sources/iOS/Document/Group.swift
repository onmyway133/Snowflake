import Foundation
import Reindeers

public class Group {

  public let items: [Item]

  public init(element: Element) {
    var items: [Item] = []

    element.children().forEach {
      if $0.name == "g" {
        items.append(contentsOf: Group(element: $0).items)
      } else if let shape = Item.make(element: $0) {
        items.append(shape)
      }
    }

    self.items = items
  }
}
