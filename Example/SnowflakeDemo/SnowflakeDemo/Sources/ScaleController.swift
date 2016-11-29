import UIKit
import Snowflake

class ScaleController: UITableViewController {
  @IBOutlet weak var cell1: UITableViewCell!
  @IBOutlet weak var cell2: UITableViewCell!
  @IBOutlet weak var cell3: UITableViewCell!

  override func viewDidLoad() {
    super.viewDidLoad()

    let document = Document.init(fileName: "snowflake")!

    cell1.contentView.addSubview(document.svg.view(size: cell1.frame.size))
    cell2.contentView.addSubview(document.svg.view(size: cell2.frame.size))
    cell3.contentView.addSubview(document.svg.view(size: cell3.frame.size))
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    [cell1, cell2, cell3].forEach { cell in
      cell?.contentView.subviews.forEach { view in
        view.center = CGPoint(x: cell?.frame.size.width/2;cell.f)
      }
    }
  }

}
