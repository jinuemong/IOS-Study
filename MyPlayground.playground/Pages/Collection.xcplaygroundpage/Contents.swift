import UIKit
import Foundation

// 기본 생성
var numbers : Array<Int> = Array<Int>()

numbers.append(1)
numbers.append(2)
numbers.append(3)

//인자 출력
numbers[0]
numbers[1]

// 중간에 넣기
numbers.insert(4,at: 2)
numbers

// 삭제
numbers.remove(at: 0)
numbers

//일반적 문자열 선언
var names: [String] = []


// 딕셔너리 생성
//var dic : Dictionary<String,Int> = Dictionary<String,Int>()
// 축약형 + 바로 생성
var dic : [String:Int] = ["생성자":1]

// 값 생성 , 변경
dic["김철수"] = 5
dic["김철수"] = 3
dic

// 값 제거
dic.removeValue(forKey: "김철수")
dic

//set : 중복 허용 안함 - 축약 선언 없음
var set :Set = Set<Int>()
set.insert(10)
set.insert(20)
set.insert(20) // 중복 값 저장 안됨
set

// set 삭제
set.remove(20)
set
