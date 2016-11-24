import Foundation
import Reindeer

typealias JSONDictionary = [String: Any]

public class Document {
  
  let components: [Component]
  
  public init?(data: Data) {
    guard let document = try? Reindeer.Document(data: data) else { return nil }

    // http://stackoverflow.com/questions/3135175/libxml2-error-with-namespaces-and-xpath
    if document.hasNamespace {
      components = document.rootElement.elements(XPath: "//new:svg", namespace: "new").map {
        return Component(element: $0)
      }
    } else {
      components = document.rootElement.elements(XPath: "//svg").map {
        return Component(element: $0)
      }
    }
  }
  
  public var views: [UIView] {
    return components.map { component in
      return component.view
    }
  }
}
