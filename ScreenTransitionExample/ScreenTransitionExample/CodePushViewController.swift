
import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    @IBAction func tabBackButton(_ sender: UIButton) {
        self.navigationController?
            .popViewController(animated: true)
    }
}
