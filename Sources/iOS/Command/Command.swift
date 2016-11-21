import Foundation

class Command {

  enum Kind {
    case absolute, relative
  }

  let kind: Kind

  required init(numbers: String, kind: Kind) {
    self.kind = kind
  }

  class func make(initial: String, numbers: String) -> Command? {
    let type: Command.Type? = availableCommands[initial.uppercased()]
    return type?.init(numbers: numbers, kind: .absolute)
  }

  static let availableCommands: [String: Command.Type] = [
    "M": MoveToCommand.self,
    "L": LineToCommand.self,
    "H": HorizontalLineToCommand.self,
    "V": VerticalLineToCommand.self,
    "C": CurveToCommand.self,
    "S": SmoothCurveToCommand.self,
    "Q": QuadraticBezierCurveCommand.self,
    "T": SmoothQuadraticBezierCurveToCommand.self,
    "A": EllipticalArcCommand.self,
    "Z": ClosePathCommand.self
  ]
}
