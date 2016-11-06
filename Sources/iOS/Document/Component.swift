import Foundation
import Reindeer

class Component {
  
  let shapes: [Shape]
  let styles: [Style]
  
  let size: CGSize
  
  init(element: Element) {
    self.size = CGSize(width: element.attributes.number(key: "width") ?? 0,
                       height: element.attributes.number(key: "height") ?? 0)
    
    self.shapes = element.children().flatMap {
      return Shape.make(element: $0)
    }
    
    self.styles = []
  }
  
  var layers: [CAShapeLayer] {
    return shapes.map { shape in
      return shape.layer
    }
  }
  
  var view: UIView {
    let view = UIView()
    
    layers.forEach { layer in
      view.layer.addSublayer(layer)
    }
      
    view.frame.size = size
    
    return view
  }
}
