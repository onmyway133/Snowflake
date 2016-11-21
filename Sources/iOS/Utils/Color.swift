import Foundation

struct Color {
  
  static func color(name: String) -> UIColor {
    if name.hasPrefix("#") {
      return color(hexString: name)
    } else if name.hasPrefix("rgb") {
      return color(rgbString: name)
    } else if let hexString = mapping[name] {
      return color(hexString: hexString)
    } else {
      return UIColor.white
    }
  }
  
  // https://github.com/hyperoslo/Hue/blob/master/Source/iOS/UIColor%2BHue.swift
  static func color(hexString: String) -> UIColor {
    var hex = hexString.hasPrefix("#")
      ? String(hexString.characters.dropFirst())
      : hexString
    
    guard hex.characters.count == 3 || hex.characters.count == 6
      else {
        return UIColor.white
    }
    
    if hex.characters.count == 3 {
      for (index, char) in hex.characters.enumerated() {
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
      return Utils.float(string: $0)
    }
    
    if components.count == 3 {
      return UIColor(red: components[0], green: components[1], blue: components[2], alpha: 1)
    } else {
      return UIColor.white
    }
  }
  
  // http://www.december.com/html/spec/colorsvghex.html
  static let mapping: [String: String] = [
    "black": "000000",
    "white": "FFFFFF",
    "red": "FF0000",
    "green": "00FF00",
    "blue": "0000FF",
    "yellow": "FFFF00",
    "pink": "FFC0CB",
    "purple": "FF00FF",
    "lime": "00FF00",
  ]
}
