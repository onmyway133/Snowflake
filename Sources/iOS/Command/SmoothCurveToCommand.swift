import Foundation

class SmoothCurveToCommand: Command {
  var controlPoint1: CGPoint = .zero
  var controlPoint2: CGPoint = .zero
  var endPoint: CGPoint = .zero

  required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count == 4 {
      controlPoint1 = CGPoint(x: numbers[0], y: numbers[1])
      controlPoint2 = controlPoint1
      endPoint = CGPoint(x: numbers[2], y: numbers[3])
    }
  }

  override func act(path: UIBezierPath, previousCommand: Command?) {
    if let previousCommand = previousCommand as? CurveToCommand {
      controlPoint1 = previousCommand.controlPoint2.reflected().add(p: path.currentPoint)
    } else if let previousCommand = previousCommand as? SmoothCurveToCommand {
      controlPoint1 = previousCommand.controlPoint2.reflected().add(p: path.currentPoint)
    }

    switch kind {
    case .absolute:
      path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
    case .relative:
      path.addCurve(to: path.currentPoint.add(p: endPoint),
                    controlPoint1: path.currentPoint.add(p: controlPoint1),
                    controlPoint2: path.currentPoint.add(p: controlPoint2))
    }
  }
}
