

import UIKit

@IBDesignable // 스토리보드 상에서 실시간으로 확인 가능하게 함 
class RoundButton: UIButton {
    // @IBInspectable : 스토리보드에서 해당 속성을 적용할 수 있도록 함
    @IBInspectable var isRound : Bool = false{
        didSet{
            if isRound{
                // 정사각형 버튼을 원으로 만듦
                // 정사각형이 아닌 버튼을 둥글게 만듦
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
