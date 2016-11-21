import Foundation

class MoveToCommand: Command {
  var point: CGPoint = .zero

  required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers  = Utils.numbers(string: string)
    if numbers.count == 2 {
      point = CGPoint(x: numbers[0], y: numbers[1])
    }
  }
}

