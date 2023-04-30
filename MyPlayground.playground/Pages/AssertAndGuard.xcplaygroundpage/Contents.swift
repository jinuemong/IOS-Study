
// assert : 특정 조건을 체크, 조건에 성립하지 않으면 메시지 출력
// -> 디버깅 모드에서만 동작하고, 주로 디버깅 중 조건의 검증을 위하여 사용

// guard : 뭔가를 검사하여 그 다음에 오는 코드를 실행할지 말지 결정
// -> 주어진 조건문이 거짓일 때 구문이 실행됨
import Foundation

// assert 예제
// 조건이 성립하지 않을 때만 에러 발생

var value = 0
assert(value==0, "값이 0입니다.")

//value = 2
//assert(value==0,"값이 0이 아닙니다.")
// -> runTime Error 발생

// gurad 예제
// 잘못 된 값이 함수에 들어오는지 확인하기 위해 주로 사용

/*
 guard 조건 else{
    조건이 false 이면 else 구문이 실해되고
    return or throw or break 를 통해서
    이 후 코드를 실행하지 않도록 한다.
 }
 */

// guard test : 값 통과
func guardTest(value : Int){
    guard value == 0 else { //0이 아닐 경우 가드에 걸림
        print("가드 미통과")
        return
    }
    print("가드 통과 ")
}

guardTest(value : 0)
guardTest(value : 2)

// gurad test : 값 변화
func guardTest2(value : Int?){
    guard let value = value else{
        print("guard is nil")
        return
    }
    print("guard test \(value)")
}

guardTest2(value: nil)
guardTest2(value: 3)
