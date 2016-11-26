import Foundation
import Reindeer

public typealias JSONDictionary = [String: Any]

public class Document {
  
  public let svg: SVG
  
  public init?(data: Data) {
    guard let document = try? Reindeer.Document(data: data) else { return nil }

    // http://stackoverflow.com/questions/3135175/libxml2-error-with-namespaces-and-xpath
    let XPath: String = document.hasNamespace ? "//new:svg" : "//svg"
    let namespace: String? = document.hasNamespace ? "new" : nil
    guard let svg: SVG = document.rootElement.elements(XPath: XPath, namespace: namespace).map({
      return SVG(element: $0)
    }).first else { return nil }

    self.svg = svg
  }
}
