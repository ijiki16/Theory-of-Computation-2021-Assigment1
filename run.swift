import Foundation

struct Move {
    var char: String
    var from: Int
    var to: Int
    
    init(char: String, from: Int, to: Int) {
        self.from = from
        self.to = to
        self.char = char
    }
}

class Automate {

    let acceptSet: Set<Int>
    var actionDic: [String: [Move]]

    init(acceptSet: Set<Int>) {
        self.acceptSet = acceptSet
        self.actionDic = [String: [Move]]()
    }

    func addAction(action: Move) {
        if actionDic.keys.contains(action.char) {
            actionDic[action.char]?.append(action)
        }else{
            let newArray: [Move] = [action]
            actionDic[action.char] = newArray
        }
    }
    
    func run(str: String) -> String {
        var curStates : Set<Int> = Set<Int>()
        curStates.insert(0)
        var res = ""
        
        for chr in str{
            if actionDic.keys.contains(String(chr)){
                let moves: [Move] = actionDic[String(chr)]!
                var newStates : Set<Int> = Set<Int>()
                var curRes = "N"
                for state in curStates{
                    for mv in moves{
                        if mv.from == state{
                            newStates.insert(mv.to)
                            if self.acceptSet.contains(mv.to){
                                curRes = "Y"
                            }
                        }
                    }
                }
                curStates = newStates
                res = res +  curRes
            }else{
                break
            }
            
        }
        res = res + String(repeating: "N", count: (string.count - res.count))
        
        return res
    }
}

let string: String = readLine()!
// not det automate
let natStr: String = readLine()!
let natArr = natStr.components(separatedBy: " ")

let n: Int = Int(natArr[0])!
let a: Int = Int(natArr[1])!
let t: Int = Int(natArr[2])!

// accepts line
var acceptSet = Set<Int>()
let acceptStr: String = readLine()!
let acceptArr = acceptStr.components(separatedBy: " ")
for acc in acceptArr{
    acceptSet.insert(Int(acc)!)
}
let nfa = Automate(acceptSet: acceptSet)

// ki moves
for j in 0..<n{
    let kmovesStr: String = readLine()!
    let kmovesArr = kmovesStr.components(separatedBy: " ")
    let ki: Int = Int(kmovesArr[0])!
    for i in 0..<ki{
        let char: String = kmovesArr[i*2+1]
        let to: Int = Int(kmovesArr[i*2+2])!
        nfa.addAction(action: Move(char: char, from: j, to: to))
    }
}

let res = nfa.run(str: string)
print("\(res)")
