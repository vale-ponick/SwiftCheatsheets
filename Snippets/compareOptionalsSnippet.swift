import Foundation

// MARK: - Сравнение двух опциональных чисел (без default)

func compareOptionalNums(_ x: Int?, _ y: Int?) -> String {
    switch (x, y) {
    case (nil, nil):
        return "Both nil"
    case (nil, .some(let y)):
        return "First nil, second = \(y)"
    case (.some(let x), nil):
        return "First = \(x), second nil"
    case (.some(let x), .some(let y)):
        if x == y { return "Equal (\(x))" }
        return x > y ? "First > Second (\(x) > \(y))" : "First < Second (\(x) < \(y))"
    }
}

// MARK: - Сравнение с заменой nil на 0 (??)

func safeCompare(_ x: Int?, _ y: Int?) -> String {
    let a = x ?? 0
    let b = y ?? 0
    
    if a == b {
        return "Equal (\(a))"
    }
    return a > b ? "First > Second (\(a) > \(b))" : "First < Second (\(a) < \(b))"
}