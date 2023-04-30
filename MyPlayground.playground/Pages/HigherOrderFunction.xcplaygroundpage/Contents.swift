
// [[ 고차 함수 ]]
// 다른 함수를 전달 인자로 받거나 함수 실행의
// 결과를 함수로 반환하는 함수

// [ 스위프트에서 제공하는 고차함수 ]
// -> map, filter, reduce

import Foundation

// map
// -> 컨테이너 내부의 기존 데이터를 변경하여 새로운 컨테이너 생성
let numbers = [0,1,2,3]
let mapArray = numbers.map { (number)-> Int in
    return number*2
}
print("map \(mapArray)")

// filter
// -> 컨테이너 내부의 값을 걸러서 새로운 컨테이너 생성

let inArray = [10,5,20,13,4]
let filterArray = inArray.filter { $0 > 5} //클로저 표현
print("filter \(filterArray)")

// reduce
// -> 컨테이너 내부 요소를 하나로 통합
let someArray = [1,2,3,4,5]
let reduceResult = someArray.reduce(0) { // 0: 초기값
    (result : Int, element : Int) -> Int in
    print("\(result) + \(element)")
    return result + element
}

print("reduce \(reduceResult)")
