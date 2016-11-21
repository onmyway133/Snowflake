import Foundation

class MoveToCommand: Command {
  var point: CGPoint = .zero

  required init(numbers: String, kind: Kind) {
    super.init(numbers: numbers, kind: kind)

    
  }
}

