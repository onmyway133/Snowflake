import CoreGraphics
import Foundation
import UIKit

public struct Animator {

  public init() {

  }

  // MARK: - Group

  public func animate(layer: CAShapeLayer) {
    let stroke = self.stroke(layer: layer)
    let opacity = self.opacity(layer: layer)

    let group = CAAnimationGroup()
    group.duration = 4
    group.animations = [stroke, opacity]
    group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)

    layer.add(group, forKey: nil)
  }

  // MARK: - Animations

  public func stroke(layer: CAShapeLayer) -> CABasicAnimation {
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.fromValue = 0
    animation.toValue = 1
    animation.duration = 3

    return animation
  }

  public func opacity(layer: CAShapeLayer) -> CABasicAnimation {
    let animation = CABasicAnimation(keyPath: "opacity")
    animation.fromValue = 0
    animation.toValue = 1
    animation.duration = 4

    return animation
  }
}
