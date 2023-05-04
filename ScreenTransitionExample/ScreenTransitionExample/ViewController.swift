//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by 김진우 on 2023/05/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabCodePushButton(_ sender: UIButton) {
        // 스토리 보드에 있는 뷰 컨트롤러를 인스턴스화 해주어야 함
        // 옵셔널로 반환하기 때문에 Guard 문으로 처리
        guard let viewController = self.storyboard?
            .instantiateViewController(withIdentifier: "CodePushViewController")
        else {
            return
        }
        
        // navigationController 의 push View Controller를 호출해서 뷰를 연결
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tabCodePresentButton(_ sender: UIButton) {
        // 마찬가지로 스토리 보드에 있는 뷰 컨트롤러를 인스턴스화
        guard let viewController  = self.storyboard?
            .instantiateViewController(withIdentifier: "CodePresentViewController")
        else{
            return
        }
        
        // 풀 스크린으로 변환 -> present 이전에 실행해야 함
        viewController.modalPresentationStyle = .fullScreen
        
        // present 메서드에 인스턴스한 Controller를 전달
        self.present(viewController, animated: true, completion: nil)
        
    }
}

  
