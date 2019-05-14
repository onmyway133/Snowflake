//
//  Command.swift
//  SnowflakeCommand
//
//  Created by khoa on 14/05/2019.
//

import CoreGraphics
import Foundation
import UIKit

public class Command {

  public enum Kind {
    case absolute, relative
  }

  public let kind: Kind

  public required init(string: String, kind: Kind) {
    self.kind = kind
  }

  public func act(path: UIBezierPath, previousCommand: Command?) {
    
  }
}

public extension Command {
  class func make(initial: String, string: String) -> Command? {
    let type: Command.Type? = availableCommands[initial.uppercased()]
    let kind: Kind = Utils.isLowercase(string: initial) ? .relative : .absolute
    return type?.init(string: string, kind: kind)
  }

  static let availableCommands: [String: Command.Type] = [
    "M": MoveToCommand.self,
    "L": LineToCommand.self,
    "H": HorizontalLineToCommand.self,
    "V": VerticalLineToCommand.self,
    "C": CurveToCommand.self,
    "S": SmoothCurveToCommand.self,
    "Q": QuadraticBezierCurveCommand.self,
    "T": SmoothQuadraticBezierCurveToCommand.self,
    "A": EllipticalArcCommand.self,
    "Z": ClosePathCommand.self
  ]

  static var letters: String {
    var result = ""
    availableCommands.forEach { (key, value) in
      result.append(key)
      result.append(key.lowercased())
    }

    return result
  }
}

public class ClosePathCommand: Command {

    convenience init() {
        self.init(string: "", kind: .absolute)
    }

    public override func act(path: UIBezierPath, previousCommand: Command?) {
        path.close()
    }
}

public class CurveToCommand: Command {
    public var controlPoint1: CGPoint = .zero
    public var controlPoint2: CGPoint = .zero
    public var endPoint: CGPoint = .zero

    public required init(string: String, kind: Kind) {
        super.init(string: string, kind: kind)

        let numbers = Utils.numbers(string: string)
        if numbers.count == 6 {
            controlPoint1 = CGPoint(x: numbers[0], y: numbers[1])
            controlPoint2 = CGPoint(x: numbers[2], y: numbers[3])
            endPoint = CGPoint(x: numbers[4], y: numbers[5])
        }
    }

    public override func act(path: UIBezierPath, previousCommand: Command?) {
        if kind == .relative {
            endPoint = path.currentPoint.add(p: endPoint)
            controlPoint1 = path.currentPoint.add(p: controlPoint1)
            controlPoint2 = path.currentPoint.add(p: controlPoint2)
        }

        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
    }
}

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

public class HorizontalLineToCommand: Command {
    public var x: CGFloat = 0

    public required init(string: String, kind: Kind) {
        super.init(string: string, kind: kind)

        let numbers = Utils.numbers(string: string)
        if numbers.count == 1 {
            x = numbers[0]
        }
    }

    public override func act(path: UIBezierPath, previousCommand: Command?) {
        let end: CGPoint

        switch kind {
        case .absolute:
            end = CGPoint(x: x, y: path.currentPoint.y)
        case .relative:
            end = CGPoint(x: path.currentPoint.x + x, y: path.currentPoint.y)
        }

        path.addLine(to: end)
    }
}

public class LineToCommand: Command {
    public var point: CGPoint = .zero

    required public init(string: String, kind: Kind) {
        super.init(string: string, kind: kind)

        let numbers = Utils.numbers(string: string)
        if numbers.count == 2 {
            point = CGPoint(x: numbers[0], y: numbers[1])
        }
    }

    public override func act(path: UIBezierPath, previousCommand: Command?) {
        if kind == .relative {
            point = path.currentPoint.add(p: point)
        }

        path.addLine(to: point)
    }
}

public class MoveToCommand: Command {
    public var point: CGPoint = .zero

    public required init(string: String, kind: Kind) {
        super.init(string: string, kind: kind)

        let numbers = Utils.numbers(string: string)
        if numbers.count == 2 {
            point = CGPoint(x: numbers[0], y: numbers[1])
        }
    }

    public override func act(path: UIBezierPath, previousCommand: Command?) {
        if kind == .relative {
            point = path.currentPoint.add(p: point)
        }

        path.move(to: point)
    }
}

public class QuadraticBezierCurveCommand: Command {
    public var controlPoint: CGPoint = .zero
    public var endPoint: CGPoint = .zero

    public required init(string: String, kind: Kind) {
        super.init(string: string, kind: kind)

        let numbers = Utils.numbers(string: string)
        if numbers.count == 4 {
            controlPoint = CGPoint(x: numbers[0], y: numbers[1])
            endPoint = CGPoint(x: numbers[2], y: numbers[3])
        }
    }

    public override func act(path: UIBezierPath, previousCommand: Command?) {
        if kind == .relative {
            endPoint = path.currentPoint.add(p: endPoint)
            controlPoint = path.currentPoint.add(p: controlPoint)
        }

        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
    }
}

public class SmoothCurveToCommand: Command {
    public var controlPoint1: CGPoint = .zero
    public var controlPoint2: CGPoint = .zero
    public var endPoint: CGPoint = .zero

    public required init(string: String, kind: Kind) {
        super.init(string: string, kind: kind)

        let numbers = Utils.numbers(string: string)
        if numbers.count == 4 {
            controlPoint2 = CGPoint(x: numbers[0], y: numbers[1])
            endPoint = CGPoint(x: numbers[2], y: numbers[3])
        }
    }

    public override func act(path: UIBezierPath, previousCommand: Command?) {
        if let previousCommand = previousCommand as? CurveToCommand {
            controlPoint1 = previousCommand.controlPoint2.reflect(around: path.currentPoint)
        } else if let previousCommand = previousCommand as? SmoothCurveToCommand {
            controlPoint1 = previousCommand.controlPoint2.reflect(around: path.currentPoint)
        } else {
            controlPoint1 = path.currentPoint
        }

        if kind == .relative {
            endPoint = path.currentPoint.add(p: endPoint)
            controlPoint2 = path.currentPoint.add(p: controlPoint2)
        }

        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
    }
}

public class SmoothQuadraticBezierCurveToCommand: Command {
    public var controlPoint: CGPoint = .zero
    public var endPoint: CGPoint = .zero

    required public init(string: String, kind: Kind) {
        super.init(string: string, kind: kind)

        let numbers = Utils.numbers(string: string)
        if numbers.count == 2 {
            endPoint = CGPoint(x: numbers[0], y: numbers[1])
        }
    }

    public override func act(path: UIBezierPath, previousCommand: Command?) {
        if let previousCommand = previousCommand as? QuadraticBezierCurveCommand {
            controlPoint = previousCommand.controlPoint.reflect(around: path.currentPoint)
        } else if let previousCommand = previousCommand as? SmoothQuadraticBezierCurveToCommand {
            controlPoint = previousCommand.controlPoint.reflect(around: path.currentPoint)
        } else {
            controlPoint = path.currentPoint
        }

        if kind == .relative {
            endPoint = path.currentPoint.add(p: endPoint)
        }

        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
    }
}

public class VerticalLineToCommand: Command {
    public var y: CGFloat = 0

    public required init(string: String, kind: Kind) {
        super.init(string: string, kind: kind)

        let numbers = Utils.numbers(string: string)
        if numbers.count == 1 {
            y = numbers[0]
        }
    }

    public override func act(path: UIBezierPath, previousCommand: Command?) {
        let end: CGPoint

        switch kind {
        case .absolute:
            end = CGPoint(x: path.currentPoint.x, y: y)
        case .relative:
            end = CGPoint(x: path.currentPoint.x, y: path.currentPoint.y + y)
        }

        path.addLine(to: end)
    }
}
