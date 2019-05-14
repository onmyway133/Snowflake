import UIKit
import Reindeers

public class Path: Item, ShapeAware {
    public let path: UIBezierPath

    public required init(attributes: JSONDictionary) {
        let d = attributes.string(key: "d") ?? ""
        self.path = UIBezierPath.from(svgPath: d)

        super.init(attributes: attributes)
    }
}
