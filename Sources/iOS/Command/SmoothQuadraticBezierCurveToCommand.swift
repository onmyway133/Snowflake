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
      controlPoint = previousCommand.controlPoint.add(p: path.currentPoint)
    } else if let previousCommand = previousCommand as? SmoothQuadraticBezierCurveToCommand {
      controlPoint = previousCommand.controlPoint.add(p: path.currentPoint)
    } else {
      controlPoint = path.currentPoint
    }

    switch kind {
    case .absolute:
      path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
    case .relative:
      path.addQuadCurve(to: path.currentPoint.add(p: endPoint),
                        controlPoint: path.currentPoint.add(p: controlPoint))
    }
  }

}
