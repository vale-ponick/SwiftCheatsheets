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
print("🧩 Задача 27 (с ?? - nil-coalescing): Та же функция compareOptionalNums, но если число nil, заменяем его на 0 (через ??), а затем сравниваем.")

// MARK: - - Задача 26. Сравнение двух опционалов Int? (nil учитывается)
func compareOptNums(_ x: Int?, _ y: Int?) -> String {
    switch (x, y) {
    case (nil, nil):
        return "Both nil"
    case (nil, .some (let y)):
        return "First nil, second = \(y)"
    case (.some (let x), nil):
        return "First = \(x), second nil"
    case (.some (let x), .some (let y)):
        if x == y { return "Equal (\(x))" }
        return x > y ? "First > Second (\(x) > \(y))" : "First < Second (\(x) < \(y))"
    }
}
// MARK: - Задача 27. Сравнение с заменой nil на 0 (nil-coalescing)
func compareWithDefault(_ x: Int?, _ y: Int?) -> String {
    if x == nil && y == nil { return "Both nil" }
    let a = x ?? 0
    let b = y ?? 0
    
    if a == b {
        return "Equal (\(a))"
    }
    return a > b ? "First > Second (\(a) > \(b))" : "First < Second (\(a) < \(b))"
}
print(compareOptNums(nil, 888)) // First nil, second = 888
print(compareOptNums(8, 888)) // First < Second (8 < 888)
print(compareWithDefault(nil, nil)) // Equal (0)
print(compareWithDefault(7, nil)) // First > Second (7 > 0)
print(compareWithDefault(77, 7)) // First > Second (77 > 7)

// MARK: - Задача 28. Сравнение двух опциональных строк (лексикографическое)

func compareStrings(_ a: String?, _ b: String?) -> String {
    switch (a, b) {
    case (nil, nil):
        return "Both nil"
    case (nil, .some(let b)):
        return "First nil, second = \(b)"
    case (.some(let a), nil):
        return "First = \(a), second nil"
    case (.some(let a), .some(let b)):
        if a == b { return "Equal" }
        return a < b ? "First < Second" : "First > Second"
    }
}

