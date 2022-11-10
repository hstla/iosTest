import Foundation

let str = "World"
print("Hello, \(str)!")

let a = 10             //type inference 타입을 추론한다.
let b = 20.0
let c = Double(a) + b
print(type(of:a))
print(type(of:b))
print("sum=\(c)")
//string interpolation

var d = 20
d += 30
print("d=\(d)")

let arr:[String] = [ "Hello", "World"]
let t = type(of:arr)
let s = "type=\(t)"
print(s)
print(arr[0])    //index
print(arr[1])

let dict = ["kim":12, "Lee":32]
print(type(of:dict))
//print(dict["Lee"])    //key

//type strict
// parenthesis ()
// curly brace {}
// square bracket []
// angled bracket <>
/// 1.  optional      ----    값이 있을 수도 있고 없을수도 있다. 없으면 nil 로 표시
/// 2. closure
///

var sum = 0
for num in 1...100{
            sum += num
}

func greet(name:String, day: String) -> (Bool, String) {
    return (name.count > 3, "Hello \(name), today is \(day)")
}
let m1 = greet(name: "Hwang", day: "tuesday")
print(m1)
type(of: m1)
m1.0
