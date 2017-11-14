import Foundation
import Reindeers

public typealias JSONDictionary = [String: Any]

public class Document {
  
  public let svg: SVG

  public convenience init?(fileName: String) {
    guard let path = Bundle.main.path(forResource: fileName, ofType: "svg"),
      let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return nil }

    self.init(data: data)
  }
  
  public init?(data: Data) {
    guard let document = try? Reindeers.Document(data: data),
      document.rootElement.name == "svg" else { return nil }

    self.svg = SVG(element: document.rootElement)
  }
}
