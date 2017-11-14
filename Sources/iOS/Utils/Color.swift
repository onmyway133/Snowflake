import CoreGraphics
import Foundation
import UIKit

struct Color {
  
  static func color(name: String) -> UIColor {
    if name.hasPrefix("#") {
      return color(hexString: name)
    } else if name.hasPrefix("rgb") {
      return color(rgbString: name)
    } else if let hexString = colorList[name] {
      return color(hexString: hexString)
    } else {
      return UIColor.clear
    }
  }
  
  // https://github.com/hyperoslo/Hue/blob/master/Source/iOS/UIColor%2BHue.swift
  static func color(hexString: String) -> UIColor {
    var hex = hexString.hasPrefix("#")
      ? String(hexString.dropFirst())
      : hexString
    
    guard hex.count == 3 || hex.count == 6
      else {
        return UIColor.white
    }
    
    if hex.count == 3 {
      for (index, char) in hex.enumerated() {
        hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
      }
    }
    
    return UIColor(
      red:   CGFloat((Int(hex, radix: 16)! >> 16) & 0xFF) / 255.0,
      green: CGFloat((Int(hex, radix: 16)! >> 8) & 0xFF) / 255.0,
      blue:  CGFloat((Int(hex, radix: 16)!) & 0xFF) / 255.0, alpha: 1.0)
  }
  
  static func color(rgbString: String) -> UIColor {
    let string = rgbString.replacingOccurrences(of: "rgb(", with: "")
      .replacingOccurrences(of: ")", with: "")
    let components: [CGFloat] = string.components(separatedBy: ",").map {
      return Utils.number(string: $0)
    }
    
    if components.count == 3 {
      return UIColor(red: components[0], green: components[1], blue: components[2], alpha: 1)
    } else {
      return UIColor.white
    }
  }
}
