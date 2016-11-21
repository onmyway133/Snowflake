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

    var initial: NSString? = ""
    var numbers: NSString? = ""
    var commands: [Command] = []

    repeat {
      scanner.scanCharacters(from: set, into: &initial)
      guard initial!.length > 0 else { break }

      scanner.scanUpToCharacters(from: set, into: &numbers)
      guard numbers!.length > 0 else { break }

      if scanner.scanLocation == string.characters.count {
        commands.append(ClosePathCommand())
      } else if let command = Command.make(initial: String(initial!), string: String(numbers!)) {
        commands.append(command)
      }
    } while initial!.length > 0
    
    return commands
  }
}
