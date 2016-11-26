import Foundation

struct Utils {

  static func number(string: String) -> CGFloat {
    let value = Double(string) ?? 0
    return CGFloat(value)
  }

  static func numbers(string: String?) -> [CGFloat] {
    guard let string = string else {
      return []
    }

    var number: Float = 0
    let scanner = Scanner(string: string)
    var numbers = [CGFloat]()

    repeat {
      scanner.scanFloat(&number)
      numbers.append(CGFloat(number))

      if scanner.scanLocation < string.characters.count - 1 {
        scanner.scanLocation += 1
      } else {
        break
      }

    } while true

    return numbers
  }

  static func isLowercase(string: String) -> Bool {
    let set = CharacterSet.lowercaseLetters

    if let scala = UnicodeScalar(string) {
      return set.contains(scala)
    } else {
      return false
    }
  }

  static func points(string: String?) -> [CGPoint] {
    var numbers = self.numbers(string: string)
    if numbers.count % 2 == 1 {
      numbers.append(0)
    }

    var points = [CGPoint]()

    numbers.enumerated().forEach { (index, _) in
      if index % 2 == 0 {
        points.append(CGPoint(x: numbers[index], y: numbers[index+1]))
      }
    }

    return points
  }
}
