import Foundation

class SmoothCurveToCommand: Command {
  var controlPoint1: CGPoint = .zero
  var controlPoint2: CGPoint = .zero
  var endPoint: CGPoint = .zero

  required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count == 4 {
      controlPoint2 = CGPoint(x: numbers[0], y: numbers[1])
      endPoint = CGPoint(x: numbers[2], y: numbers[3])
    }
  }

  override func act(path: UIBezierPath, previousCommand: Command?) {
    if let previousCommand = previousCommand as? CurveToCommand {
      switch previousCommand.kind {
      case .absolute:
        controlPoint1 = path.currentPoint.reflect(point: previousCommand.controlPoint2)
      case .relative:
        let old = path.currentPoint.subtract(p: previousCommand.endPoint)
        controlPoint1 = path.currentPoint.reflect(point: previousCommand.controlPoint2, old: old)
      }
    } else if let previousCommand = previousCommand as? SmoothCurveToCommand {
      switch previousCommand.kind {
      case .absolute:
        controlPoint1 = path.currentPoint.reflect(point: previousCommand.controlPoint2)
      case .relative:
        let old = path.currentPoint.subtract(p: previousCommand.endPoint)
        controlPoint1 = path.currentPoint.reflect(point: previousCommand.controlPoint2, old: old)
      }
    } else {
      controlPoint1 = path.currentPoint
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
