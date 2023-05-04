

import UIKit

class CodePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func tabBackButton(_ sender: UIButton) {
        self.presentedViewController?
            .dismiss(animated: true, completion: nil)
    }
}
