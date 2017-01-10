import CoreGraphics
import Foundation
import UIKit

public class Command {

  public enum Kind {
    case absolute, relative
  }

  public let kind: Kind

  public required init(string: String, kind: Kind) {
    self.kind = kind
  }

  public func act(path: UIBezierPath, previousCommand: Command?) {
    
  }
}

public extension Command {
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
