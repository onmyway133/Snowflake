import Foundation

extension Dictionary {
  
  func number(key: String) -> CGFloat? {
    if let key = key as? Key,
      let value = self[key] as? String {
      return Utils.float(string: value)
    }
    
    return nil
  }
  
  func string(key: String) -> String? {
    if let key = key as? Key {
      return self[key] as? String
    }
    
    return nil
  }
  
  func color(key: String) -> UIColor? {
    if let value = string(key: key) {
      return Color.color(name: value)
    }
    
    return nil
  }
  
  func merge(another: JSONDictionary) -> JSONDictionary {
    var result = JSONDictionary()
    
    self.forEach {
      if let key = $0 as? String {
        result[key] = $1
      }
    }
    
    another.forEach {
      result[$0] = $1
    }
    
    return result
  }
}
