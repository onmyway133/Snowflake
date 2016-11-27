import Foundation

public struct Animator {

  public init() {

  }

  public func stroke(layer: CAShapeLayer) {
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.fromValue = 0
    animation.toValue = 1
    animation.duration = 10

    layer.add(animation, forKey: "stroke")
  }
}
