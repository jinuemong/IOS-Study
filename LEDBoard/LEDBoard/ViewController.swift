//
//  ViewController.swift
//  LEDBoard
//
//  Created by 김진우 on 2023/05/09.
//

import UIKit

class ViewController: UIViewController ,LEDBoardSettingDelegate{

    @IBOutlet weak var contentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentLabel.textColor = .yellow
    }
    
    // segue로 화면 전환했기 때문에 prepare 오버라이드  진행
    // 함수를 사용하기 위해서 다운케스팅 진행
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue
            .destination as? SettingViewController{
            settingViewController.delegate
            = self
            // 현재 설정값을 전달해 주어야 함
            settingViewController.ledText = self.contentLabel.text
            settingViewController.textColor = self.contentLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }
    
    // 위임 받은 함수 사용 -> 전달 받은 데이터 세팅
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.contentLabel.text = text
        }
        self.contentLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
}

