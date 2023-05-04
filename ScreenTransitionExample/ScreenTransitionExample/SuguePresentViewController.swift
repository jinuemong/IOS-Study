
import UIKit

class SuguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tabBackButton(_ sender: UIButton) {
        // 아래 메서드 호출로 Back Button 클릭 시
        // 이전 화면으로 전환하게 된다.
        
        self.presentingViewController?
            .dismiss(animated: true, completion: nil)
            
    }
}
