import Foundation

class QuadraticBezierCurveCommand: Command {
  var controlPoint: CGPoint = .zero
  var endPoint: CGPoint = .zero

  required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count >= 4 {
      controlPoint = CGPoint(x: numbers[0], y: numbers[1])
      endPoint = CGPoint(x: numbers[2], y: numbers[3])
    }
  }

  override func act(path: UIBezierPath) {
    switch kind {
    case .absolute:
      path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
    case .relative:
      break
    }
  }
}
