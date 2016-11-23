import Foundation

class EllipticalArcCommand: Command {
  var radius: CGPoint = .zero
  var rotation: CGFloat = 0
  var largeArcFlag: Bool = false
  var sweepFlag: Bool = false
  var endPoint: CGPoint = .zero

  required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count == 7 {
      radius = CGPoint(x: numbers[0], y: numbers[1])
      rotation = numbers[2]
      largeArcFlag = numbers[3] > 0 ? true : false
      sweepFlag = numbers[4] > 0 ? true : false
      endPoint = CGPoint(x: numbers[5], y: numbers[6])
    }
  }

  override func act(path: UIBezierPath) {
    switch kind {
    case .absolute:
      break
    case .relative:
      break
    }
  }
}
