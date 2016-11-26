import Foundation

class SmoothQuadraticBezierCurveToCommand: Command {
  var controlPoint: CGPoint = .zero
  var endPoint: CGPoint = .zero

  required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count == 2 {
      endPoint = CGPoint(x: numbers[0], y: numbers[1])
    }
  }

  override func act(path: UIBezierPath, previousCommand: Command?) {
    if let previousCommand = previousCommand as? QuadraticBezierCurveCommand {
      switch previousCommand.kind {
      case .absolute:
        controlPoint = path.currentPoint.reflect(point: previousCommand.controlPoint)
      case .relative:
        let old = path.currentPoint.subtract(p: previousCommand.endPoint)
        controlPoint = path.currentPoint.reflect(point: previousCommand.controlPoint, old: old)
      }
    } else if let previousCommand = previousCommand as? SmoothQuadraticBezierCurveToCommand {
      switch previousCommand.kind {
      case .absolute:
        controlPoint = path.currentPoint.reflect(point: previousCommand.controlPoint)
      case .relative:
        let old = path.currentPoint.subtract(p: previousCommand.endPoint)
        controlPoint = path.currentPoint.reflect(point: previousCommand.controlPoint, old: old)
      }
    } else {
      controlPoint = path.currentPoint
    }

    path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
  }

}
