// 상속의 개념

import Foundation

// 상수 앞에 final 키워드를 넣을 경우 상속할 수 없음
class Vehicle {
    var currentSpead = 0.0
    var description : String{
        return "travling at \(currentSpead) miles per hour"
    }
    func makeNise()  {
        print("skeep on")
    }
    
}


/*
 class 클래스 이름 : 부모 클래스 이름 {
    // 하위 클래스 정의
 }
 */

class Bicycle : Vehicle{ //모든 메서드 상속
    var hasBasket = false
}

var bicycle = Bicycle()

bicycle.currentSpead
bicycle.currentSpead = 15.0
bicycle.currentSpead


// [ 오버라이딩 ] : 부모의 메서드를 재정의

class Train : Vehicle{
    override func makeNise() {
        super.makeNise() //부모 메서드 먼저 호출
        // 오버라이드 하면서 기존의 기능 사용 :super
        print("choo choo")
    }
}

let train = Train()
train.makeNise()


// 슈퍼 클래스 프로퍼티를 오버라이드
// 서브 클래스에서 프로퍼티를 오버라이드해서 재정의
// get, set도 사용 가능 + 타입 일치함

class Car : Vehicle{
    var gear = 1
    override var description: String{
        // override
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpead = 30.0
car.gear = 2
print(car.description)

// [ 프로퍼티 옵저버를 상속 ] //

class AutomaticCar : Car{
    override var currentSpead: Double {
        // currentSpead가 변경되면 옵저버가 감지, -> gear 값 변경
        didSet{ //프로퍼티 옵저버
            gear = Int(currentSpead/10)+1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpead = 35.0
print("AutomaticCar : \(automatic.description)")

