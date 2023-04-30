// 옵셔널 체이닝 : 옵셔널에 속해 있는 nil 일지도 모르는
// 프로퍼티, 메서드, 서브스크립션 등을 가져오거나 호출할 때 사용할 수 있는 일련의 과정
// 값이 있다면 호출, nil이라면 nil 반환

import Foundation

struct Developer{
    let name : String
}

struct Company{
    let name : String
    var developer : Developer?
}

var developer = Developer(name : "han")
var company = Company(name : "Gunter", developer : developer)
print(company.developer)
//print(company.developer.name) //에러 발생
// ->company.developer : 옵셔널 타입
// ->company.developer.name : 옵셔널에 감싸진 타입
// 2번의 경우는 옵셔널을 벗긴 후에 .name에 접근해야 함
// 이러한 경우에 옵셔널 체이닝을 사용 ! [ ! ? or ! 사용 ]
print(company.developer?.name) //옵셔널에 감싸진 채로 출력
print(company.developer!.name) //강제 언래핑 -> 옵셔널에서 벗겨진 값

// 옵셔널을 벗기기 위해서는 옵셔널 바인딩을 사용해야 함

