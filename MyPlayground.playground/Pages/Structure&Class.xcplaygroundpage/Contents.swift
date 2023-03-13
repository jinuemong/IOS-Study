import UIKit

// 구조체 : 데이터를 요구에 맞게 표현 , 하나의 사용자 정의 데이터 타입 제작
// 클래스와 구조체 차이점 확인 !

/*
 struct 구조체 이름 {
    프로퍼터와 메서드
 }
 */


struct User{
    var nickname : String
    var age : Int
    
    // 함수도 제작 가능
    func information(){
        print("\(nickname) \(age)")
    }
}

//인스턴스 생성 : 구조체 or 클래스를 사용하기 위한 실체화
// 자동 구조화 됨

var user = User(nickname: "jinwoo", age: 26)

print(user.nickname)

//구조체 변경 방법
user.nickname = "jinwo 2 "
print(user.nickname)

//구조체 함수 실행
user.information()


//클래스 : 구조체와 비슷

/*
 class 클래스 이름{
    프로퍼터와 메서드
 }
 */


class Dog{
    var name : String = ""
    var age : Int = 0
    
    init(){
        //초기화 구문
    }
    
    func introduce(){
        print("\(name) \(age)")
    }
}

var dog = Dog()

dog.name = "minho"
dog.age = 31

dog.introduce()
