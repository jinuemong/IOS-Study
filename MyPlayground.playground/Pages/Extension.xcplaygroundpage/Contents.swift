
// Swift의 중요 기능
// 기존의 클래스, 구조체, 열거형, 프로토콜에 새로운 기능을 추가하는 기능

/* [ 익스텐션 타입에 추가할 수 있는 기능 ]
 연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
 타입 메서드 / 인스턴스 메서드
 이니셜라이저
 서브스크립트
 중첩 타입
 특정 프로포콜을 준수할 수 있도록 기능 추가
 */
import Foundation

/*
 extension SomeType{
    // 추가 기능
 }
 */

// << 대표 기능 2가지 예제 확인하기 >>
// 1. [ 기존 형 확장 ]
// Int 값이 짝수 or 홀수인지 확인하는 연산 프로퍼티
// Int 형을 확장함
extension Int{
    var isEven : Bool{
        return self % 2 == 0
    }
    
    var isOdd : Bool{
        return self % 2 == 1
    }
}

var number = 3
number.isEven
number.isOdd

//2. [ 타입의 메서드 추가 ]
extension String{
    // 문자열 to Int 로 변환하는 메서드 추가
    func convertToInt() -> Int?{
        return Int(self)
    }
}

var string = "0"
string.convertToInt()
