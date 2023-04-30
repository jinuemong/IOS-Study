
// 클래스 구조체 또는 열거형의 인스턴스를 사용하기 위한 준비 과정
// 인스턴스가 생성되면 init이 호출 됨
import Foundation

/*
 init(매개변수 : 타입, ...) {
    // 프로퍼터 초기화
    // 인스턴스 생성시 필요한 설정을 해주는 코드 작성
 }
 */

class User{
    var nickname : String
    var age : Int
    
    // param에 따라서 다른 init 가능
    init(nickname:String , age: Int){
        self.nickname = nickname
        self.age = age
    }
    
    init(age:Int){
        self.nickname = "jinwoo init"
        self.age = age
    }
    
    // initialization과 반대 역할
    // 클래스 인스턴스 내에서만 구현 가능
    deinit{
        print("deinit user")
    }
}


var user = User(nickname: "jinwoo", age: 23)
user.nickname
user.age
 

var user2 = User(age: 23)
user.nickname
user.age


var user3 : User? = User(age:23)
user3 = nil //deinit 호출 
