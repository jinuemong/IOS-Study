

import UIKit

class CodePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    

    @IBAction func tabBackButton(_ sender: UIButton) {
        self.presentingViewController?
            .dismiss(animated: true, completion: nil)
    }
}
