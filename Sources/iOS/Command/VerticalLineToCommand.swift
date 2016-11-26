import Foundation

class VerticalLineToCommand: Command {
  var y: CGFloat = 0

  required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count == 1 {
      y = numbers[0]
    }
  }

  override func act(path: UIBezierPath, previousCommand: Command?) {
    let end: CGPoint

    switch kind {
    case .absolute:
      end = CGPoint(x: path.currentPoint.x, y: y)
    case .relative:
      end = CGPoint(x: path.currentPoint.x, y: path.currentPoint.y + y)
    }

    path.addLine(to: end)
  }
}
