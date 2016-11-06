import Foundation

struct Color {
  
  static func color(name: String) -> UIColor {
    if name.hasPrefix("#") {
      return color(hexString: name)
    }
    
    if let hexString = mapping[name] {
      return color(hexString: hexString)
    }
    
    return UIColor.white
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
  
  // http://www.december.com/html/spec/colorsvghex.html
  static let mapping: [String: String] = [
    "green": "008000"
  ]
}
