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
    if kind == .relative {
      y = path.currentPoint.y + y
    }

    let end = CGPoint(x: 0, y: y)
    path.addLine(to: end)
  }
}
