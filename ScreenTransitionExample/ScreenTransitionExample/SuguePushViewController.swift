

import UIKit

class SuguePushViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var name : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    @IBAction func tabBackButton(_ sender: UIButton) {
        // 이전 화면으로 이동
        self.navigationController?
            .popViewController(animated: true)
        // Main Root View Controller로 이동
//        self.navigationController?
//            .popToRootViewController(animated: true)
    }
}
