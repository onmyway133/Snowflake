import Foundation

class LineToCommand: Command {
  var point: CGPoint = .zero

  required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count == 2 {
      point = CGPoint(x: numbers[0], y: numbers[1])
    }
  }

  override func act(path: UIBezierPath) {
    switch kind {
    case .absolute:
      path.addLine(to: point)
    case .relative:
      let end = Utils.add(p1: path.currentPoint, p2: point)
      path.addLine(to: end)
    }
  }
}
