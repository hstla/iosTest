import UIKit

protocol Increasing {
    func increaseValue(amount:Int) -> Int
    mutating func increase(amount: Int)
}

extension Int: Increasing {
    func increaseValue(amount: Int) -> Int {
        return self + amount
    }
    mutating func increase(amount: Int) {
        self += amount
    }
}

var v = 3
v.increase(amount: 10)
3.increaseValue(amount: 7)


extension Double: Increasing {
    func increaseValue(amount: Int) -> Int {
        return Int(self) + amount
    }
    mutating func increase(amount: Int) {
        self += Double(amount)
    }
}

//10.increaseValue(amount: 3)
//10.2.increasedValue(amount: 4)
//
//let numbers:[Increasing] = [5, 6.7]
//for n in numbers {
//    n.increasedValue(amount: 500)
//}
