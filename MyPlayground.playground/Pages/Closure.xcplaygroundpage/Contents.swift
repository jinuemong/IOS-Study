
// [ 클로저 : Closure ]
// 코드에서 전달 및 사용할 수 있는 독립 기능 블록,
// 일급 객체의 역할을 할 수 있음
// 일급 객체 : 전달 인자로 보낼 수 있고, 변수/상수 등으로 저장하거나 전달
// -> 함수의 반환 값이 될 수 도 있다.

// 이름없는 함수, 익명함수를 지칭하기도 함 (named, unnamed)

import Foundation

// 클로저 표현식

/*
 { (매개 변수) -> 리턴 타입 in -
    / 실행 구문
 }
 헤드와 바디로 구분
 헤드 : (매개 변수) -> 리턴 타입
 바디 : 실행 구문
 in 키워드로 구분
 */
  
// 파라미터 & 리턴타입이 없는 클로저
let hello = { () -> () in
    print("hello1")
}

hello()

// 파라미터 & 리턴타입이 있는 클로저
let hello2 = { (name : String) -> (String) in
    return "hello2 , \(name)"
    
}



// [!]
// 클로저에서는 전달인자 레이블을 사용하지 않음
// 오직 파라미터 name만 사용
// hello2(name: "jinwoo" )  사용 시 에러 !
print(hello2("jinwoo"))

//[!] 클루저는 함수의 파라미터 타입으로도 전달 가능 함
// -> 클로저가 일급 객체이기 때문
// [ 함수 파라미터로 클루저 전달 받기 ]

// 빈 함수 파라미터 클루저
func doSomethings(closure : () -> ()){
    closure()
}

doSomethings(closure: { () -> () in
    print("hello3")
})

// 클루저를 반환하는 함수 파라미터 클루저

func doSomething2() -> () -> (){
    return { () -> () in
        print("hello4")
    }
}

doSomething2()()

// [ 후행 클로저 ]
// -> 클로저가 길어져 가독성이 떨어질 때 사용
// 맨 마지막 매개변수가 전달되는 클로저에만 할당
// 매개변수와 클로저 여러개를 전달할 때 맨 마지막 클로저만 후행 클로저로 사용 가능

doSomethings(){
    print("hello2")
}

// 단 하나의 클로저만 매개변수로 전달할 경우 소괄호 생략 가능
doSomethings{
    print("hello2_ 소괄호 생략")
}


// [ 다중 후행 클로저 ]
// 매개변수에 클로저가 여러개 있는 경우

func doSomething3(success : () -> (), fail : () -> ()){
    
}


doSomething3 { // 첫 번째 클루저는 매개변수 레이블 생략
     // -> success : 생략
} fail : {
     // -> fail 구문
}

// 클루저 표현 간소화
// 문법을 최적화하여 클루저 표현 간략화

func doSomethings4(closure : (Int, Int, Int) -> Int){
    closure(1,2,3)
}

// 생략 1. 파라미터 데이터 타입 생략
doSomethings4(closure: {(a,b,c) in
    return a+b+c
})

// 생략 2. 파라미터 생략 -> 약식인수 사용 $
doSomethings4(closure:{
    return $0+$1+$2
})

// 생략 3. 리턴 타입 생략 -> 단일 리턴인 경우
// print() 문을 추가하면 에러 발생 -> return 추가해야 함
doSomethings4(closure:{
    $0+$1+$2
})

// 생략 4. 클로저 생략
doSomethings4(){
    $0+$1+$2
}

// 생략 5. 소괄호 생략
// 단 하나의 클로저만 매개변수로 전달하는 경우
doSomethings4 {
    $0+$1+$2
}
