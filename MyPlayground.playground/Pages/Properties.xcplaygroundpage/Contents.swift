
// 클래스 ,구조체, 열거형 등에 관련된 값을 뜻함
// 저장, 연산, 타입 으로 나뉨

import Foundation

// [ 저장 프로퍼티 ] //
struct Dog { //구조체 내에 선언됨 -> 저장 프로퍼티
    var name : String
    let gender :String
}

var dog = Dog(name:"gunter",gender:"Male")
print(dog)

dog.name = "gunter2"
//dog.gender = "female" -> error let은 상수라 변경 불가능



let dog2 = Dog(name:"gunter",gender:"male")
//dog2.name = "권태완"
// -> error let 선언 구조체는 변수를 변경 불가능
// 내부 프포퍼티도 상수로 선언됨

class Cat{
    var name : String
    let gender : String
    
    init(name:String, gender :String){
        self.name = name
        self.gender = gender
    }
}

let cat = Cat(name:"json",gender:"male")
cat.name = "gunter"
print(cat.name)

//구조체는 value 타입이라서 상수로 선언하면 변수로 선언 된
//프로퍼티라 해도 값을 변경할 수없음
//반면 클래스는 상수로 선언해도 값 변경 가능 (상수 변수는 역시 불가능)


// [ 연산 프로퍼티 ] //
// get, set을 통해서 값을 연산하고 프로퍼티에 전달하는 역할
struct Stock {
    var averagePrice :Int
    var quantity : Int
    var purchansePrice :Int{ //연산되어 저장됨
        get {
            return averagePrice * quantity
        }
        
        set(newPrice){
           averagePrice = newPrice / quantity
            //총 매입가 / 주식수량  -> 평균 단가
        } // 새로운 값이 설정되면 매개변수로 전달
        
//        set{ //매개변수 이름이 없는 set
//            // default = newValue
//            averagePrice = newValue/quantity
//        }
    }
}


var stock = Stock(averagePrice:2300,quantity : 3)
print(stock)

//get
stock.purchansePrice

//set
stock.purchansePrice = 3000
stock.averagePrice

//set 함수를 통해서 평균 단가가 변경 됨

// [ 옵저버 프로퍼티 ] //
// 프로퍼티 값의 변화를 관찰하고 반영함
// 새로운 값이 기존 값과 같더라도 호출 됨
// 프로퍼티가 set 될 때마다 호출
// 값이 저장되기 직전, 값이 저장된 직후 2가지
// willSet : 새로 저장될 프로퍼티 값을 상수 매개변수로 전달 (기본 값 : newValue)
// didSet : 프로퍼티의 기본 값이 상수 매개변수로 전달 (기본 값 : oldValue)

class Account{
    var credit :Int = 0{
        //소괄호 이름 지정
        willSet{
            print("잔액이 \(credit)원에서 \(newValue)원으로",
                  "변경될 예정입니다.")
        }
        
        didSet{
            print("잔액이 \(oldValue)원에서 \(credit)원으로",
            "변경되었습니다.")
        }
            
    }
}

var account = Account()
account.credit = 1000
 
// [ 타입 프로퍼티 ] //
// 인스턴스 생성 없이 객체 내의 프로퍼티에 접근 가능하게 함
// 저장 , 연산 프로퍼티에서만 사용 가능
// static 키워드 사용해서 정의

struct SomeStructure{
    static var storedTypeProperty = "Some value." //store
    static var computedTypeProperty : Int{ //컴퓨디드
        return 1
    }
}

SomeStructure.computedTypeProperty
SomeStructure.storedTypeProperty
// 인스턴스 생성 없이 타입 이름과 타임 프로퍼티 이름으로 호출
SomeStructure.storedTypeProperty = "hello"
// 값도 변경 가능

