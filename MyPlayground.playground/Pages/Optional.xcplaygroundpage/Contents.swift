
// 선택적인 : 값이 있을 수도 있고 없을 수도 있음

// null -> nil 사용
// 타입 뒤에 물음표 필요

//var number : Int? = nil int는 nil 사용 시 에러

// 기본 값 지정
var optionalName : String? = "normal"
optionalName
//Optional("normal") 이 출력 (Optional로 포장 되어 있음)

//명시적 해제 : 강제 해제 ,비강제 해제

//강제 해제 : 간편하지만 에러 발생 위험
var number:Int? = 3
print(number) // Optional(3) 출력
print(number!)// 3 출력

//비강제 해제 : 값을 추출하고 실패 시 else 실행
if let result = number{
    print(result)
}else{}


//옵셔널 추출
// if로 바인딩하면 if 블럭 내에서만 사용 가능
// 아래 함수를 통해서 사용하면 함수 전체 부분에서 사용 가능
// true일 경우 추출하고 아닐 경우 return
// guard 문에서 거르기

func test(){
    let number:Int? = 5
    guard let result = number else { return }
    print(result)
}

test()

//묵시적 해제 : 컴파일러 자동 해제, 옵셔널의 묵시적 해제

//컴파일러 자동 해제

//비교 연산자에 옵셔널 값을 넣을 경우 컴파일러가 자동 해제 (묵시적)
let value:Int? = 6
if value == 6 {
    print("value is 6 ")
}else{
    print("value is not 6 ")
}


//묵시적 옵셔널 해제

let string = "12"
//!를 사용한 묵시적 해제
var stringToInt: Int! = Int(string)
print(stringToInt + 1)
