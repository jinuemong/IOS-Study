
// 프로토콜 : 특정 역할을 하기 위한 메서드, 프로퍼티, 기타 요구사항 등의 청사진
// 청사진 : 아키텍처 또는 공학 설계를 문서화한 기술 도면
// 프로토콜의 요구사항을 충족하면 해당 사항이 프로토콜 요구사항을 충족함

import Foundation

/*
protocol 이름 {
 
}
 */

protocol SomeProtocol1 {
    
}

protocol SomeProtocol2 {
    
}
// 여러 프로토콜 동시에 사용 가능
struct SomeStructrue : SomeProtocol1, SomeProtocol2{
    
}

// 상속과 함께 프로토콜 채택
//struct SomeStructrue : SomeSuperClass,SomeProtocol1, SomeProtocol2{
//
//}

// 프로토콜로 프로퍼티 준수 사항 설정
protocol FirstProtocol {
    // 항상 변수로 요구사항 정의
    // type 선언 후 get, set 설정
    var name : Int {get set} //읽기, 쓰기
    var age : Int { get } //읽기
}

protocol AnotherProtocol {
    // 프로토콜에서 타입 프로퍼티를 요구하려면 항상 static으로 선언해야 함
    static var someTypeProperty : Int { get set }
}

protocol FullyNames{
    var fullName : String { get set }
    func printFullName()
}

struct Person : FullyNames{
    // FullyNames 프로토콜을 준수하지 않을 경우 에러 발생
    var fullName: String // -> 정의 시 에러 사라짐
    func printFullName() {
        "프로토콜 준수를 위한 func 선언"
    }
}


protocol SomeProtocol3{ //메서드 요구사항 정의
    func someTypeMethod()
}


protocol SomeProtocol4{ //생성자 요구사항 정의
    //생성자 키워드와 매개변수만 정의
    init(someParameter: Int)
}

class SomeClass : SomeProtocol4{
    // 클래스 생성자는 [required] 팔요
    // 구조체 생성자는 생략 가능
    // 클래스가 상속 받을 수 없는 final 클래스라면 필요 없음
    
    required init(someParameter: Int) {
        
    }
}
