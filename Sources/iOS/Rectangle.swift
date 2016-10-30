import UIKit

class Rectangle: Shape {
  let frame: CGRect
  let cornerRadius: CGPoint

  override init?(attributes: JSONDictionary) {
    fatalError()
  }
}
