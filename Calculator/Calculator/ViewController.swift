//
//  ViewController.swift
//  Calculator
//
//  Created by 김진우 on 2023/05/13.
//

import UIKit

// 열거형 선언
enum Operation{
    case Plus
    case Minus
    case Divide
    case Multiply
    case unKnown
}
class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 계산기의 선택 값을 가지고 있는 프롬퍼티
    // 계산기 버튼을 누를 때마다 number의 숫자를 나타냄
    var displayNumber  = ""
    var firstOperand = "" // 이전 계산 값을 저장하는 프롬퍼티
    var secondOperand = "" // 새롭게 저장 된 값
    var result = "" // 계산의 결과 값
    
    // 현재 계산기에 어떤 연산 값이 적용 되었는지 확인
    var currentOperation : Operation = .unKnown //초기값
    
    
    @IBAction func tabNumberButton(_ sender: UIButton) {
        //선택 버튼의 타이틀 값 가져오기
        guard let numberValue = sender.titleLabel?.text
        else {return}
        // displayNumber에 표시, 최대 9자리
        if self.displayNumber.count < 9{
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    // 초기화 버튼
    @IBAction func clearButton(_ sender: UIButton) {
        self.displayNumber  = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unKnown
        self.numberOutputLabel.text = "0"
    }
    
    @IBAction func tabDotButton(_ sender: UIButton) {
        // 소수점 포함 8자리, 점은 숫자가 8자리 넘으면 사용할 수 없음
        // 중복 . 사용 불가능
        if self.displayNumber.count < 8,
           !self.displayNumber.contains("."){
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutputLabel.text = displayNumber
        }
    }
    

    @IBAction func divideButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    @IBAction func MultiplyButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        self.operation(.Minus)
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        self.operation(.Plus)
    }

    
    @IBAction func equalButton(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation : Operation){
        if self.currentOperation != .unKnown{
            // 두 피연산자를 연산
            if !self.displayNumber.isEmpty{
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else {return}
                guard let secondOpearnd = Double(self.secondOperand) else {return}
                
                switch self.currentOperation{
                case .Plus:
                    self.result = "\(firstOperand+secondOpearnd)"
                case .Minus:
                    self.result = "\(firstOperand-secondOpearnd)"
                case .Multiply:
                    self.result = "\(firstOperand*secondOpearnd)"
                case .Divide:
                    self.result = "\(firstOperand/secondOpearnd)"
                default:
                    break
                    
                }
                
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0{
                    self.result = "\(Int(result))"
                }
                // 결과값 저장
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            // 오퍼레이션 저장
            self.currentOperation = operation
        }else{
            // 계산기가 초기화 된 상태
            // 첫 번째 피연산자와 연산자를 선택한 상태
            self.firstOperand = self.displayNumber // 화면에 표시 된 숫자값
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
}

