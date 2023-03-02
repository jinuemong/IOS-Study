//조건문 if , switch , guard
import UIKit

//if

let age = 12

if age < 19{
    print("미성년")
}else{
    print("성년")
}

//switch

let color = "Green"
// 단순 비교
switch color{
case "Blue":
    print("blue !")
case "Green":
    print("green !")
default:
    print("찾는 색상이 없습니다 !")
}

// 범위 비교
let temperature = 20

switch temperature{
case -20...9:
    print("겨울")
case 9...25:
    print("봄 or 가을")
case 25...40:
    print("여름")
default:
    print("이상 기후")
}
