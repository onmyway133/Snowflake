import UIKit

class PathShape: Shape {
  
  let commands: [Command]
  
  required init(attributes: JSONDictionary) {
    self.commands = PathShape.parse(string: attributes.string(key: "d") ?? "")
    
    super.init(attributes: attributes)
    
    let path = UIBezierPath()
    self.commands.enumerated().forEach { (index, command) in
      var previousCommand: Command? = index > 0 ? commands[index-1] : nil
      command.act(path: path, previousCommand: previousCommand)
    }
    
    self.path = path
  }
  
  static func parse(string: String) -> [Command] {
    let set = CharacterSet(charactersIn: Command.letters)
    let scanner = Scanner(string: string)

    var initial: NSString? = ""
    var numbers: NSString? = ""
    var commands: [Command] = []

    repeat {
      scanner.scanCharacters(from: set, into: &initial)
      guard initial!.length > 0 else { break }

      scanner.scanUpToCharacters(from: set, into: &numbers)
      guard numbers!.length > 0 else { break }

      if let command = Command.make(initial: String(initial!), string: String(numbers!)) {
        commands.append(command)
      }

      if scanner.scanLocation == string.characters.count {
        break
      }
    } while initial!.length > 0
    
    return commands
  }
}
