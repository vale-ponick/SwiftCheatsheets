// 🧩 Задача: Найти первый положительный элемент в опциональном массиве
// Условия: 
// - массив nil или пустой → "No data"
// - нет положительных элементов → "No positive numbers"  
// - есть положительный → "First positive: <значение>"

// MARK: - Вариант 1: Simple (if let)
// 📏 Правило: Guard — только на выход. Логика — после.
func firstPositive_simple(in array: [Int]?) -> String {
    guard let array = array, !array.isEmpty else { return "No data" }
    
    let positiveElement = array.first(where: { $0 > 0 })
    if let first = positiveElement {
        return "First positive: \(first)"
    } else {
        return "No positive numbers"
    }
}

// MARK: - Вариант 2: Effective (два guard) ⭐ ЛЮБИМЫЙ
// 📏 Правило: Guard — только на выход. Логика — после.
func firstPositive_effective(in nums: [Int]?) -> String {
    guard let nums = nums, !nums.isEmpty else { return "No data" }
    guard let first = nums.first(where: { $0 > 0 }) else { return "No positive numbers" }
    return "First positive: \(first)"
}

// MARK: - Вариант 3: Short (map + ??)
// 📏 Правило: map преобразует optional, ?? ловит nil
func firstPositive_short(in numbers: [Int]?) -> String {
    guard let numbers = numbers, !numbers.isEmpty else { return "No data" }
    return numbers.first(where: { $0 > 0 })
        .map { "First positive: \($0)" }
        ?? "No positive numbers"
}