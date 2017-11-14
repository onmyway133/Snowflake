import UIKit
import Reindeers

public class Image: Item {

  let rect: CGRect
  let image: UIImage?

  public required init(attributes: JSONDictionary) {
    self.rect = CGRect(x: attributes.number(key: "x") ?? 0,
                       y: attributes.number(key: "y") ?? 0,
                       width: attributes.number(key: "width") ?? 0,
                       height: attributes.number(key: "height") ?? 0)

    self.image = Image.parse(string: attributes.string(key: "href") ?? "")
    super.init(attributes: attributes)
  }

  public func layer() -> CALayer {
    let layer = CALayer()
    layer.contents = image?.cgImage

    return layer
  }

  // MARK: - Helper

  static func parse(string: String) -> UIImage? {
    guard !string.isEmpty else { return nil }

    let header = "data:image/png;base64,"
    guard string.range(of: header) != nil else {
      return nil
    }

    guard let data = Data(base64Encoded: string, options: .ignoreUnknownCharacters) else { return nil }

    return UIImage(data: data)
  }
}
