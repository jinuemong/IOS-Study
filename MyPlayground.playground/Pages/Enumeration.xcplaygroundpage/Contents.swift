
// 열거형
// -> 연관성 있는 값을 모아 놓은 것을 말함
// -> 기본 정수 숫자 형식의 명명된 상수 집합에 의해 정의되는 값 형식

import Foundation

enum CompassPoint {
    case north
    case south
    case east
    case west
    // -> 한줄로 나열도 가능 case n,s,e,w..
}


var direction = CompassPoint.east //접근법
direction = .north //자동 추론 되므로 .으로 접근 가능

switch direction {
case .north:
    print("north")
    
case .south:
    print("south")
    
case .east:
    print("east")
    
case .west:
    print("west")
}


// 열거형은 항목의 원시값을 가지게 할 수있음
// -> 특정 타입으로 지정 된 값을 가지게 할 수 있음
// :String을 통해서 타입 지정
// 다른 프로그래밍 언어는 보통 Int형만 열거 가능,
// swift는 다양한 타입 가능

enum CompassPoint2 :String {
    case north = "북"
    case south = "남"
    case east = "동"
    case west = "서"
    
}

var direction2 = CompassPoint2.east

// 원시 값 출력하기 : .rawValue
switch direction2 {
case .north:
    print(direction2.rawValue)

case .south:
    print(direction2.rawValue)

case .east:
    print(direction2.rawValue)

case .west:
    print(direction2.rawValue)
}

// 열거형에 값 넣기
// 연관 된 값으로 가질 수 있음
// 추론해서 "남"을 rawValue로 가지는 CompassPoint2를 출력
let direction3 = CompassPoint2(rawValue: "남")

// 연관값을 어떻게 가지는지 확인
enum PhoneError {
    case unknown
    case batteryLow(String) //항목에 연관값 추가 : 항목(타입)
}

let error = PhoneError.batteryLow("배터리가 곧 방전됩니다.")

// 연관값 추출
switch error {
case .batteryLow(let message):
    print(message)
case .unknown:
    print("알 수 없는 에러입니다.")
}
