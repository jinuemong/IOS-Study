import UIKit

func sum(a:Int, b: Int) -> Int{
    return a+b
}

sum(a:5,b:3)

// 매개변수에 기본값 설정해도 됨
func hello(friend:String="jinwoo") -> String{ //Void로 반환해도 됨
    return "hello \(friend)"
}

hello()
  
/* 전달인자 레이블 생성 (코드 가독성을 높이기 위함 ).
 func 함수이름(전달인자 레이블: 매개변수 이름: 매개변수 타입,
        전달인자 레이블 : 매개변수 타입....) -> 번환 타입
 */

func sendMessage(from myName: String, to name:String)->String{
    return "Hello \(name) ! I'M \(myName)"
}

sendMessage(from : "jinwoo", to: "Json")


// 가변 매개변수
func sendMessage(me:String, friends:String...)->String{
    return "Hello \(friends)! I'm \(me)"
}

// 배열로 넘겨줌
sendMessage(me: "jinwoo", friends:"f1","f2","f3")
