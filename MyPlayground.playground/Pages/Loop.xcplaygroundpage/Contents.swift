
import UIKit

/*
 for 루프상수 in 순회 대상 {
 //실행 구문
 }
 */


//for

for i in 1...4{
    print(i)
}

let array = [1,2,3,4,5]

for i in array{
    print(i)
}


// while

/*
 while 조건식 {
    //실행 구문
 }
 */

var number = 5

while number < 10{
    number+=2
    print("is : ",number)
}


// repeat - while (do-while과 비슷)

/*
 repeat {
 // 실행 구문
 } while 조건식
 */

//한 번은 반드시 실행

var x = 6

repeat{
    x+=2
}while x < 5

print(x)
