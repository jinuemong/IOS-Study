//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by 김진우 on 2023/05/04.


import UIKit

class ViewController: UIViewController ,SendDataDelegate{

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewController : view Load")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewController : view will appear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewController : view did appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewController : view will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewController : view did disappear")
    }

    @IBAction func tabCodePushButton(_ sender: UIButton) {
        // 스토리 보드에 있는 뷰 컨트롤러를 인스턴스화 해주어야 함
        // 옵셔널로 반환하기 때문에 Guard 문으로 처리
        guard let viewController = self.storyboard?
            .instantiateViewController(withIdentifier: "CodePushViewController")
                as? CodePushViewController // 다운 캐스팅
        else {
            return
        }
        viewController.name = "Jinwoo"
        // navigationController 의 push View Controller를 호출해서 뷰를 연결
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tabCodePresentButton(_ sender: UIButton) {
        // 마찬가지로 스토리 보드에 있는 뷰 컨트롤러를 인스턴스화
        guard let viewController  = self.storyboard?
            .instantiateViewController(withIdentifier: "CodePresentViewController")
                as? CodePresentViewController // 다운 캐스팅
        else{
            return
        }
        
        // 풀 스크린으로 변환 -> present 이전에 실행해야 함
        viewController.modalPresentationStyle = .fullScreen
        
        viewController.name = "Jinwoo"
        // present 메서드에 인스턴스한 Controller를 전달
        
        viewController.delegate = self // 델리게이트 위임 받기 , 프로토콜을 채택해야 함
        self.present(viewController, animated: true, completion: nil)
        
    }
    
 
    // 위임 받았기 때문에 함수 사용 가능
    func sendData(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
}

  

// 다운 캐스팅 진행으로 다음 뷰에 대한 객체에 접근이 가능
