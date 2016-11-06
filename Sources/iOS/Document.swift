import Foundation
import Reindeer

typealias JSONDictionary = [String: Any]

class Document {
  
  let components: [Component]
  
  init?(data: Data) {
    guard let document = try? Reindeer.Document(data: data) else { return nil }
    
    components = document.rootElement.children(name: "svg").map {
      return Component(element: $0)
    }
  }
}
