import UIKit
import Snowflake

class ScaleController: UIViewController {

  @IBOutlet weak var view1: UIView!
  @IBOutlet weak var view2: UIView!
  @IBOutlet weak var view3: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()

    let document = Document.init(fileName: "snowflake")!

    view1.addSubview(document.svg.view(size: view1.frame.size))
    view2.addSubview(document.svg.view(size: view2.frame.size))
    view3.addSubview(document.svg.view(size: view3.frame.size))
  }
}
