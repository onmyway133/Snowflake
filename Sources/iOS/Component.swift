import Foundation
import Reindeer

class Component {
  
  let shapes: [Shape]
  let styles: [Style]
  
  let size: CGSize
  
  init(element: Element) {
    self.size = CGSize(width: element.attributes.number(key: "width"),
                       height: element.attributes.number(key: "height"))
    
    self.shapes = element.children().flatMap {
      return Shape.make(element: $0)
    }
    
    self.styles = []
  }
  
  var layers: [CAShapeLayer] {
    return paths.map { path in
      let layer = CAShapeLayer()
      layer.path = path.cgPath
      
      return layer
    }
  }
  
  var paths: [UIBezierPath] {
    return shapes.flatMap { shape in
      return shape.path
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
