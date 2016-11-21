import Foundation

class ClosePathCommand: Command {

  convenience init() {
    self.init(string: "", kind: .absolute)
  }
}
