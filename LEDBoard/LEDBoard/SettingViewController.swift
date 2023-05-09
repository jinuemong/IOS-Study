

import UIKit

// 변경값 선택 후 이전 뷰 컨트롤러로 데이터 전달

protocol LEDBoardSettingDelegate : AnyObject{
    func changedSetting(text:String?,textColor:UIColor,
                        backgroundColor : UIColor)
}
class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pButton: UIButton!
    @IBOutlet weak var yButton: UIButton!
    @IBOutlet weak var gButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var oButton: UIButton!
    
    weak var delegate : LEDBoardSettingDelegate?
    var ledText : String?
    var textColor : UIColor = .yellow
    var backgroundColor : UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 전달 받은 값 호출
        self.configureView()
    }
    
    // 이전의 설정값을 전달 받기 위함
    private func configureView(){
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColorButton(color: self.backgroundColor)
    }
    
    @IBAction func tabTextColorButton(_ sender: UIButton) {
        // 3개의 버튼중에 하나에 대한 액션함수를 지정하고
        // 드래그 앤 드롭으로 나머지 버튼을 추가하면
        // 모든 버튼에 대한 이벤트 처리를 할 수 있음
        // sender를 통해서 버튼을 구분
        if sender == self.yButton{
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.pButton{
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        } else if sender == self.gButton{
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
        
    }
    
    @IBAction func tabBackGroundColorButton(_ sender: UIButton) {
        
        if sender == self.bButton{
            self.changeBackgroundColorButton(color: .black)
            self.backgroundColor = .black
        }else if sender == self.blueButton{
            self.changeBackgroundColorButton(color: .blue)
            self.backgroundColor = .blue
        } else if sender == self.oButton{
            self.changeBackgroundColorButton(color: .orange)
            self.backgroundColor = .orange
        }
    }
     
    // 저장 버튼을 눌렀을 때 Delegate에서 정의한
    // chagedSetting 메서드를 호출
    // 파라미터로 설정값이 저장된 프로퍼티를 전달
    @IBAction func saveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(
            text: textField.text,
            textColor: textColor,
            backgroundColor: backgroundColor)
        // 이전 화면으로 이동 
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    private func changeTextColor(color : UIColor){
        // 삼항연산자
        // true면 button의 alpha 값을 1
        // false면 0.2로 설정
        self.yButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.pButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.gButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColorButton(color : UIColor){
        // 삼항연산자
        // true면 button의 alpha 값을 1
        // false면 0.2로 설정
        self.bButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.oButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
