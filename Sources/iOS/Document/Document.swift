import Foundation
import Reindeer

public typealias JSONDictionary = [String: Any]

public class Document {
  
  public let svg: SVG
  
  public init?(data: Data) {
    guard let document = try? Reindeer.Document(data: data),
      document.rootElement.name == "svg" else { return nil }

    self.svg = SVG(element: document.rootElement)
  }
}
