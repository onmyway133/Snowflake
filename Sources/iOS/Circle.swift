import UIKit

class Circle: Shape {
  let center: CGPoint
  let radius: CGFloat
  
  override init?(attributes: JSONDictionary) {
    fatalError()
  }
}
