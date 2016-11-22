import Foundation

struct Utils {

  static func number(string: String) -> CGFloat {
    let value = Double(string) ?? 0
    return CGFloat(value)
  }

  static func numbers(string: String) -> [CGFloat] {
    return string.trim().components(separatedBy: " ").flatMap {
      return number(string: $0)
    }
  }

  static func isLowercase(string: String) -> Bool {
    let set = CharacterSet.lowercaseLetters

    if let scala = UnicodeScalar(string) {
      return set.contains(scala)
    } else {
      return false
    }
  }

  static func points(string: String?, outerSeparator: String, innerSeparator: String) -> [CGPoint] {
    let pairs: [String] = string?.trim().components(separatedBy: outerSeparator) ?? []
    return pairs.flatMap { pair in
      let components = pair.trim().components(separatedBy: innerSeparator)
      if components.count == 2 {
        return CGPoint(x: Utils.number(string: components[0]),
                       y: Utils.number(string: components[1]))
      } else {
        return nil
      }
    }
  }
}
