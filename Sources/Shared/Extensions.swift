import Foundation

extension Dictionary {
  
  func number(key: String) -> CGFloat {
    if let key = key as? Key {
      return (self[key] as? CGFloat) ?? 0
    }
    
    return 0
  }
  
  func string(key: String) -> String {
    if let key = key as? Key {
      return (self[key] as? String) ?? ""
    }
    
    return ""
  }
}
