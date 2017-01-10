import CoreGraphics
import Foundation
import UIKit

public class QuadraticBezierCurveCommand: Command {
  public var controlPoint: CGPoint = .zero
  public var endPoint: CGPoint = .zero

  public required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count == 4 {
      controlPoint = CGPoint(x: numbers[0], y: numbers[1])
      endPoint = CGPoint(x: numbers[2], y: numbers[3])
    }
  }

  public override func act(path: UIBezierPath, previousCommand: Command?) {
    if kind == .relative {
      endPoint = path.currentPoint.add(p: endPoint)
      controlPoint = path.currentPoint.add(p: controlPoint)
    }

    path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
  }
}
