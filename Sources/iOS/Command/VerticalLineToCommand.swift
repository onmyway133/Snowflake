import Foundation

class VerticalLineToCommand: Command {
  var y: CGFloat = 0

  required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count >= 1 {
      y = numbers[0]
    }
  }

  override func act(path: UIBezierPath) {
    switch kind {
    case .absolute:
      let end = CGPoint(x: 0, y: y)
      path.addLine(to: end)
    case .relative:
      let end = Utils.add(p1: path.currentPoint, p2: CGPoint(x: 0, y: y))
      path.addLine(to: end)
    }
  }
}
