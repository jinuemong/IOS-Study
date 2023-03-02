import UIKit
import Foundation

var greeting = "Hello, playground"
  
for i in 0...99{
    i
}

// 상수
let a : Int = 100
// b = 300 - error
 
// 변수
var b : Int = 100
b = 300


// UInt
var someUInt : UInt = 200
// someUInt = -100 -> error

// Flaot
var someFloat : Float = 1.1
someFloat = 1
print(someFloat)
// 1.0으로 변환되어 저장 됨 error x (double도 마찬가지)


//Character 문자 하나만 저장 가능 (이모티콘 허용 )
var someCharacter : Character = "가"
someCharacter  = "A"
someCharacter = "😀"
print(someCharacter)

// 타입 추론 - 자동 타입 지정
var k = 10
print(k)
 
