import Foundation

class ClosePathCommand: Command {

  convenience init() {
    self.init(numbers: "", kind: .absolute)
  }
}
