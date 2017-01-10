import CoreGraphics
import Foundation
import UIKit

public class SmoothCurveToCommand: Command {
  public var controlPoint1: CGPoint = .zero
  public var controlPoint2: CGPoint = .zero
  public var endPoint: CGPoint = .zero

  public required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count == 4 {
      controlPoint2 = CGPoint(x: numbers[0], y: numbers[1])
      endPoint = CGPoint(x: numbers[2], y: numbers[3])
    }
  }

  public override func act(path: UIBezierPath, previousCommand: Command?) {
    if let previousCommand = previousCommand as? CurveToCommand {
      controlPoint1 = previousCommand.controlPoint2.reflect(around: path.currentPoint)
    } else if let previousCommand = previousCommand as? SmoothCurveToCommand {
      controlPoint1 = previousCommand.controlPoint2.reflect(around: path.currentPoint)
    } else {
      controlPoint1 = path.currentPoint
    }

    if kind == .relative {
      endPoint = path.currentPoint.add(p: endPoint)
      controlPoint2 = path.currentPoint.add(p: controlPoint2)
    }

    path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
  }
}
