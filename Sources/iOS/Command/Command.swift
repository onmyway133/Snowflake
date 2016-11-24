import Foundation

class Command {

  enum Kind {
    case absolute, relative
  }

  let kind: Kind

  required init(string: String, kind: Kind) {
    self.kind = kind
  }

  func act(path: UIBezierPath, previousCommand: Command?) {
    
  }
}

extension Command {
  class func make(initial: String, string: String) -> Command? {
    let type: Command.Type? = availableCommands[initial.uppercased()]
    let kind: Kind = Utils.isLowercase(string: initial) ? .relative : .absolute
    return type?.init(string: string, kind: kind)
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

  static var letters: String {
    var result = ""
    availableCommands.forEach { (key, value) in
      result.append(key)
      result.append(key.lowercased())
    }

    return result
  }
}
