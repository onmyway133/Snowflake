import Foundation

struct Utils {

  static func float(string: String) -> CGFloat {
    let value = Double(string) ?? 0
    return CGFloat(value)
  }

  static func floats(string: String) -> [CGFloat] {
    return string.components(separatedBy: " ").flatMap {
      return float(string: $0)
    }
  }
}
