

import UIKit

protocol SendDataDelegate : AnyObject{
    func sendData(name : String)
}

class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name : String?
    
    // delegate 변수 앞에는 반드시 weak 키워드를 붙여야 함
    // 메모리 누수 발생 가능성 방지
    weak var delegate : SendDataDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
 
    }
    

    @IBAction func tabBackButton(_ sender: UIButton) {
        // 데이터를 전달 받은 뷰 컨트롤러에서 sendData delegate 프로토콜을 채택
        // 델리게이트를 위임 받아서 senData delegate 프로토콜을 생성한 이전 화면 뷰
        // 컨트롤러에서 sendData 함수가 실행 됨
        self.delegate?.sendData(name: "Jinwoo ")
        self.presentingViewController?
            .dismiss(animated: true, completion: nil)
    }
}
