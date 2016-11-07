import UIKit

class PathShape: Shape {
  
  let commands: [Command]
  
  required init(attributes: JSONDictionary) {
    self.commands = PathShape.parse(string: attributes.string(key: "d") ?? "")
    
    super.init(attributes: attributes)
    
    self.path = UIBezierPath()
  }
  
  static func parse(string: String) -> [Command] {
    let set = CharacterSet.letters
    let scanner = Scanner(string: string)
    
    var result: NSString? = ""
    scanner.scanUpToCharacters(from: set, into: &result)
    print(result)
    scanner.scanUpToCharacters(from: set, into: &result)
    print(result)
    scanner.scanUpToCharacters(from: set, into: &result)
    print(result)
    
    return []
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

class Command {
  
  enum Kind {
    case absolute, relative
  }
}

class MoveToCommand: Command {

}

class LineToCommand: Command {

}

class HorizontalLineToCommand: Command {
  
}

class VerticalLineToCommand: Command {

}

class CurveToCommand: Command {
  
}

class SmoothCurveToCommand: Command {
  
}

class QuadraticBezierCurveCommand: Command {
  
}

class SmoothQuadraticBezierCurveToCommand: Command {
  
}

class EllipticalArcCommand: Command {
  
}

class ClosePathCommand: Command {
  
}

