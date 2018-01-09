//Solution goes in Sources
import Foundation

struct PhoneNumber {
    var startingNumber: String
    init(_ startingNumber: String) {
        self.startingNumber = startingNumber
    }
    
    var number: String {
        if startingNumber.count <= 9 || startingNumber.first == "2" {
            return "0000000000"
        } else if startingNumber.count >= 11 && startingNumber.contains("11"){
            return String(startingNumber.dropFirst())
        } else {
            var arr = [String]()
            for m in startingNumber {
                let num = "0123456789"
                if num.contains(m) {
                    arr.append(String(m))
                }
            }
            return arr.joined()
        }
    }
    
    var areaCode: String {
        let index = number.index(number.startIndex, offsetBy: 3)
        return number.substring(to: index)
    }
}
extension PhoneNumber: CustomStringConvertible {
    var description: String {
        var num = number
        num.insert("(", at: num.startIndex)
        num.insert(")", at: num.index(num.startIndex, offsetBy: 4))
        num.insert(" ", at: num.index(num.startIndex, offsetBy: 5))
        num.insert("-", at: num.index(num.startIndex, offsetBy: 9))
        return num
    }
}
