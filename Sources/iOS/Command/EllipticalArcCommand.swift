import CoreGraphics
import Foundation
import UIKit

public class EllipticalArcCommand: Command {
  public var radius: CGPoint = .zero
  public var rotation: CGFloat = 0
  public var largeArcFlag: Bool = false
  public var sweepFlag: Bool = false
  public var endPoint: CGPoint = .zero

  public required init(string: String, kind: Kind) {
    super.init(string: string, kind: kind)

    let numbers = Utils.numbers(string: string)
    if numbers.count == 7 {
      radius = CGPoint(x: numbers[0], y: numbers[1])
      rotation = numbers[2]
      largeArcFlag = numbers[3] > 0 ? true : false
      sweepFlag = numbers[4] > 0 ? true : false
      endPoint = CGPoint(x: numbers[5], y: numbers[6])
    }
  }

  public override func act(path: UIBezierPath, previousCommand: Command?) {
    switch kind {
    case .absolute:
      break
    case .relative:
      break
    }
  }
}
