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

  override func act(path: UIBezierPath) {
    switch kind {
    case .absolute:
      let end = CGPoint(x: x, y: 0)
      path.addLine(to: end)
    case .relative:
      let end = path.currentPoint.add(p: CGPoint(x: x, y: 0))
      path.addLine(to: end)
    }
  }
}
