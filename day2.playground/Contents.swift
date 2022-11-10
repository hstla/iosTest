import Foundation
import os


func points(num:Int, bonus:(Int)->Bool) -> Int {
    var pt = num * 10
    if bonus(num) {
        pt += 1
    }
    return pt
}

points(num:4) { n in
    return n % 2 != 0
}

func odd(nnn:Int) -> Bool {
    return (nnn % 2) != 0
}

points(num: 10, bonus: odd)
points(num: 7, bonus: odd)

func neg(nn:Int) ->Bool {
    return nn < 0
}

let negative = { (num:Int) -> Bool in
    num % 2 != 0
}


points(num: 7, bonus: neg)
points(num: -5, bonus: neg)


func incrementor(num:Int) -> (() -> Int) {
    var value = 0
    func increase() -> Int {
        value += num
        return value
    }
    return increase
}

let inc3 = incrementor(num: 3)
let inc7 = incrementor(num: 7)
inc3()
inc3()
inc7()
inc3()


//closure  괄호를 미리 닫을 수 있다.


var nums = [1,13,34,35,34,5,65,67,8,7,89,123,4356,0,3]
nums.sort(by: {(n1:Int ,n2:Int) -> Bool in n1 < n2})       //Int, Bool 생략가능
nums
nums.sort(by: {$0 > $1})
nums
nums.sort(by:<)
nums


// let gt:((Double, Double) -> Bool) = >

class Animal {
    var legCount = 0
    var name:String = ""
    init(name: String) {
        self.name = name
    }
    func desc() -> String {
        return "Animal:\(name) with \(legCount) legs"
    }
}

// Upper case, Lower case
// case-sensitice vs case insensitive
// Camelcase ==> swift
// UpperCameCase lowerCameCase
// snake_case
// ALL_CAPS_UNDERSCORE

let a1 = Animal(name:"giraffe")
a1.desc()
//let d1 = a1.desc()
//let l1 = a1.legCount

//let m1 = Animal()
//m1.legCount = 10
//let desc = m1.desc()


// 상속 instance

class Mamal: Animal {
    override init(name: String) {
        super.init(name: name)
        self.legCount = 4
    }
    func giveBirth() -> Mamal {
        return baby()
    }
        func baby() -> Mamal {
            return Mamal(name: "Baby \(name)")
        }
        
}

let m1 = Mamal(name: "Elephant")
m1.desc()
let b = m1.giveBirth()
b.desc()

//m1 is Mamal
// is-a relationship
//m1 is Animal
let gc = b.giveBirth()
gc.name


class Dog: Mamal {
    func bark() -> String { "Bark!"}
    override func baby() -> Mamal {
        return Dog(name: "\(name)'s puppy")
    }
}

let jd = Dog(name: "Jindol")
jd.bark()
m1 is Dog
let puppy = jd.giveBirth()
puppy.name
puppy is Dog      // is는 runtime에서 체크하기 때문에 true가 나오지만
//puppy.bark()  컴파일에서는 puppy를 mamal로 인식
if puppy is Dog {
    (puppy as? Dog)?.bark()
}

let ddd = (m1 as? Dog)
ddd?.bark()

let animals = [
    Dog(name: "jd"),
    Mamal(name: "Elephant")
]

for a in animals {
    print(a.name)
    print(a.legCount)
}
// 효율적ㅇ니것보다 결과를 내는 것이 중요하다


class Monster: Mamal {
    //stored property vs computed porperty
    //func getKneeCount()->Int {legCount}
    var kneeCount: Int{
        get{
            return legCount
        }
    }
    var toeCount: Int{
        get {
            return legCount * 4
        }
        set(count) {
            legCount = count / 4
            }
        }
    var eyeCount = 0 {
        didSet {
            legCount = 2 * eyeCount
        }
        willSet {
            
        }
    }
}
let m = Monster(name: "Mon")
m.eyeCount = 128
m.legCount
m.legCount


