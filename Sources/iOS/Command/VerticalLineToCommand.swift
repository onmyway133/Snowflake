import CoreGraphics
import Foundation
import UIKit

public class VerticalLineToCommand: Command {
  public var y: CGFloat = 0

  public required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count == 1 {
      y = numbers[0]
    }
  }

  public override func act(path: UIBezierPath, previousCommand: Command?) {
    let end: CGPoint

    switch kind {
    case .absolute:
      end = CGPoint(x: path.currentPoint.x, y: y)
    case .relative:
      end = CGPoint(x: path.currentPoint.x, y: path.currentPoint.y + y)
    }

    path.addLine(to: end)
  }
}
