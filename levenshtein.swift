import Foundation


func lev(_ a:String, _ b:String) -> Int {
    let lenA = a.length()
    let lenB = b.length()
    if minOfTwo(lenA, lenB) == 0 {
        return max(lenA, lenB)
    }
    let aMinus = a.withsubCostFirst()
    let bMinus = b.withsubCostFirst()
    if a.first == b.first{
        return lev(aMinus, bMinus)
    }
    return 1 + min([lev(aMinus,b), lev(a,bMinus), lev(aMinus,bMinus)])!    
}

func levDyn(_ a: String, _ b: String) -> Int {
    let lenA = a.length()
    let lenB = b.length()
    var D = zeros(lenA + 1,lenB + 1)
    var subCost: Int = 0
    for i in 0...lenA{
        D[i][0] = i
    }
    for j in 0...lenB{
        D[0][j] = j
    }
    for i in 1...lenA {
        for j in 1...lenB {
            if a.nth(i - 1) == b.nth(j - 1){
                subCost = 0
            } else {
                subCost = 1
            }
            D[i][j] = min(D[i - 1][j] + 1, D[i][j - 1] + 1, D[i - 1][j - 1] + subCost )

        }
    }
    return D[lenA][lenB]

}










func zeros(_ m:Int, _ n: Int) -> [[Int]] {
    return [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
}

func max<T: Comparable>(_ x: T, _ y: T) -> T{
    if x >= y {
        return x
    } else {
        return y
    }
}

func minOfTwo<T: Comparable>(_ x: T, _ y: T) -> T {
    if x <= y {
        return x
    } else {
        return y
    }
}

func min<T: Comparable>(_ array: [T]) -> T? {
    guard var minimum: T = array.first else {
        return nil
    }

    for x in array {
        if min(x,minimum) <= minimum {
            minimum = x
        }
    }
    return minimum
}


extension String {
    func length() -> Int {
        var len: Int = 0
        for _ in self {
            len += 1 
        }
        return len
    }

    func isEmpty() -> Bool{
        return self == ""
    }

    func withsubCostFirst() -> String {
        if self.isEmpty() {
            return ""
        }
        let indexAfterFirst = index(after: startIndex)
        return String(self[indexAfterFirst...])
    }

    func nth(_ n:Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: n)])
    }

    
}