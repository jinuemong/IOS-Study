
// 에러처리
// -> 프로그램 내에서 에러가 발생한 상황에 대해 대응하고 이를 복구하는 과정

// [ 처리하기 위한 동작 ] //
// 발생(throwing)
// 감지(catching)
// 전파(propagating)
// 조작(manipulating)

import Foundation

enum PhoneError : Error{
    case unknown
    case batteryLow(batteryLevel : Int) //남은 배터리 표시
}

// 오류 던지기
//throw PhoneError.batteryLow(batteryLevel : 20)

// [ 오류 처리 4가지 방식 ] //

// 1. 함수에서 발생한 오류를 해당 함수에서 호출한 코드에 전파

func checkPhoneBatteryStatus(batteryLevel: Int) throws ->String{
    // 쓰로잉 함수, 함수의 반환값이 있다면 반환값 추가 가능
    guard batteryLevel != -1 else {throw PhoneError.unknown}
    // guard -> false 문에서 else가 실행되며 함수가 조기 종료 됨
    // -1일 경우 false가 실행되어서 unknown 에러 발생
    
    guard batteryLevel > 20 else {throw
        PhoneError.batteryLow(batteryLevel: 20)}
    // 20보다 작은 경우 발생
    
    // -1이 아니며, 20보다 작은 경우가 아니라면 return 반환
    return "배터리 상태가 정상입니다."
}

// 2. do - catch 구문으로 처리

/*
 do {
    -> try 오류 발생 가능 코드
 } catch 오류 패턴 {
    -> 오류 처리 코드
 }
 */

do {
    // -1 ,20 넣어서 에러 발생 확인하기
    try checkPhoneBatteryStatus(batteryLevel : 20)
    
} catch PhoneError.unknown{
    print("알 수 없는 에러입니다. ")
} catch PhoneError.batteryLow(let batteryLevel){
    print("배터리 전원 부족!! 남은 배터리 : \(batteryLevel)%")
} catch {
    print("그 외 오류 발생 : \(error)") //error : 지역 변수 (에러 정보)
}

// 3. 옵셔널 값으로 오류 처리
// -> try ? 코드를 통해서 오류를 옵셔널 값으로 변환하여 처리
// -> 오류 시 nil 반환

let status1 = try? checkPhoneBatteryStatus(batteryLevel: -1 )
print(status1)

let status2 = try? checkPhoneBatteryStatus(batteryLevel: 20 )
print(status2)

let status3 = try? checkPhoneBatteryStatus(batteryLevel: 50 )
print(status3)

// 4. 오류가 발생하지 않을 것으로 확신
// -> try! 사용
// -> 확신할 때 사용, 런타임 에러가 발생할 수 있으므로 주의해서 사용

let status = try! checkPhoneBatteryStatus(batteryLevel: 30)
