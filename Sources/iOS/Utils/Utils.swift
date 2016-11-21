import Foundation

struct Utils {

  static func number(string: String) -> CGFloat {
    let value = Double(string) ?? 0
    return CGFloat(value)
  }

  static func numbers(string: String) -> [CGFloat] {
    return string.components(separatedBy: " ").flatMap {
      return number(string: $0)
    }
  }
}
