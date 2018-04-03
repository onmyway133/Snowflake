import CoreGraphics
import Foundation
import UIKit

public struct Utils {

  static func number(string: String) -> CGFloat {
    var number: Float = 0
    let scanner = Scanner(string: string)
    scanner.scanFloat(&number)

    return CGFloat(number)
  }

  static func numbers(string: String?) -> [CGFloat] {
    guard let string = string else {
      return []
    }

    var number: Float = 0
    let scanner = Scanner(string: string)
    var numbers = [CGFloat]()

    repeat {
      let result = scanner.scanFloat(&number)

      if result {
        numbers.append(CGFloat(number))
      }

      if scanner.scanLocation < string.count - 1 {
        if !result {
          scanner.scanLocation += 1
        }
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

  // MARK: - Ratio

  static func ratio(from: CGSize, to: CGSize) -> CGFloat {
    return min(to.width / from.width, to.height / from.height)
  }

  // MARK: - Bounds

  public static func bounds(layers: [CALayer]) -> CGRect {
    let paths: [CGPath] = layers.compactMap {
      return ($0 as? CAShapeLayer)?.path
    }

    return bounds(paths: paths)
  }

  public static func bounds(paths: [CGPath]) -> CGRect {
    var rect = CGRect.zero

    paths.forEach { path in
      rect = path.boundingBox.union(rect)
    }

    return rect
  }

  public static func transform(layers: [CALayer], transform: CGAffineTransform) {
    for layer in layers {
      if let layer = layer as? CAShapeLayer, let cgPath = layer.path {

        let path = UIBezierPath(cgPath: cgPath)
        path.apply(transform)

        layer.path = path.cgPath
      }
    }
  }
}
