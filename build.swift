import Foundation

class NFA : CustomStringConvertible{

    var data: String

    init(data: String) {
        self.data = data
    }
    
    func union(second : NFA){
        //TODO
    }
    
    public var description: String { return "MyClass: \(data)" }
}

func regex2NFA(regex: String) -> NFA {
//    var i = regex.count - 1
    if regex.count - 1 ==0 {
        return NFA(data: regex)
    }
    
    var balance = 0
    
    for index in regex.indices {
        
        let char = regex[index]
        
        if(char == "("){
            balance += 1
        }else if(char == ")"){
            balance -= 1
        }else if(char == "|" && balance == 0){
            let a = String(regex[..<index])
            let b = String(regex[index...].dropFirst())
            let left = regex2NFA(regex: a)
            let right = regex2NFA(regex: b)
            print(left)
            print(right)
            left.union(second: right)
            return left
        }
        print("character is \(char) and balance = \(balance)")
        
//        (1or0)|((y)*)*
    }
    
    var curString = ""
//    var i = regex.endIndex
   while i >= regex.startIndex {
       let curIndex = regex.index(regex.startIndex, offsetBy: i)
       if regex[i] == "*" {

       }else if regex[i] == ")" {

       }else{

       }
       i -= 1
   }
    
    
    
    
    return NFA(data: "")
}

let regex = readLine()!
let nfa = regex2NFA(regex: regex)

print(nfa)
