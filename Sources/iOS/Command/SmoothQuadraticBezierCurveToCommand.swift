import CoreGraphics
import Foundation
import UIKit

public class SmoothQuadraticBezierCurveToCommand: Command {
  public var controlPoint: CGPoint = .zero
  public var endPoint: CGPoint = .zero

  required public init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count == 2 {
      endPoint = CGPoint(x: numbers[0], y: numbers[1])
    }
  }

  public override func act(path: UIBezierPath, previousCommand: Command?) {
    if let previousCommand = previousCommand as? QuadraticBezierCurveCommand {
      controlPoint = previousCommand.controlPoint.reflect(around: path.currentPoint)
    } else if let previousCommand = previousCommand as? SmoothQuadraticBezierCurveToCommand {
      controlPoint = previousCommand.controlPoint.reflect(around: path.currentPoint)
    } else {
      controlPoint = path.currentPoint
    }

    if kind == .relative {
      endPoint = path.currentPoint.add(p: endPoint)
    }

    path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
  }
}
