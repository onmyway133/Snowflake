import Foundation

public class ClosePathCommand: Command {

  convenience init() {
    self.init(string: "", kind: .absolute)
  }

  public override func act(path: UIBezierPath, previousCommand: Command?) {
    path.close()
  }
}
