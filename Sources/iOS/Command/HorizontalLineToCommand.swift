import Foundation

class HorizontalLineToCommand: Command {
  var x: CGFloat = 0

  required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count == 1 {
      x = numbers[0]
    }
  }

  override func act(path: UIBezierPath, previousCommand: Command?) {
    let end: CGPoint

    switch kind {
    case .absolute:
      end = CGPoint(x: x, y: path.currentPoint.y)
    case .relative:
      end = CGPoint(x: path.currentPoint.x + x, y: path.currentPoint.y)
    }

    path.addLine(to: end)
  }
}
