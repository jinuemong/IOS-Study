//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

class SomeClass{
    var count:Int = 0
}

struct SomeStruct{
    var count : Int = 0
}

var class1 = SomeClass()
var class2 = class1
var class3 = class1

class3.count = 2
class1.count
//클래스는 값 참조로 인해서 참조 된 인스턴스 값이 변경

var struct1 = SomeStruct()
var struct2 = struct1
var struct3 = struct1
struct3.count = 30
struct1.count
// struct는 변경 안됨
