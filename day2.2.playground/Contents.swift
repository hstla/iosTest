import Foundation

enum Rank: Int {
    case ace = 1
    case jack, king, queen
    case two, three, four, five, six, seven, eight, nine, ten
    func desc() -> String{
        switch (self) {
        case .ace : return "Ace"
        case .jack : return "Jack"
        case .king : return "King"
        case .queen : return "Queen"
        default: return String(self.rawValue)
        }
    }
}

//let r1:Rank = Rank.Ace
//let r2 = Rank.King
//let r3:Rank = .Queen

var r = Rank.jack
r.desc()
r = .queen
r.desc()

let r1 = Rank.jack
let r2 = Rank.queen
Rank.three.desc()

r1.rawValue
r1.rawValue < r2.rawValue

enum ServerResponse {
    case Result(String, String, Int)
    case Error(String)
}
let resp = ServerResponse.Result("Seoul", "ok", 200)
let err = ServerResponse.Error("Not Found")

func describe(about sr: ServerResponse) -> String {
    switch sr {
    case let .Result(city, msg, code):
        return "OK<\(city),\(msg),\(code)>"
    case let .Error(emsg):
        return "NOK:\(emsg)"
    }
}

describe(about: resp)
describe(about: err)
