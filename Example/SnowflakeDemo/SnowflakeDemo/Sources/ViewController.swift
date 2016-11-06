import UIKit
import Snowflake

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    
    load()
  }
  
  func load() {
    guard let path = Bundle.main.path(forResource: "circle", ofType: "svg"),
      let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
      let document = Snowflake.Document(data: data)
    else { return }
    
    document.views.forEach { view in
      view.center = self.view.center
      self.view.addSubview(view)
    }
  }
}

