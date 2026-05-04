import Foundation

// MARK: - Из массива строк в словарь: слово → длина (без дубликатов, без учёта регистра)

// Вариант 1: Set + Dictionary(uniqueKeysWithValues:)
// ⚠️ Упадёт, если в Set попадут одинаковые ключи (но Set гарантирует уникальность)
func analyzeUniqueKeys(_ input: [String]) -> [String: Int] {
    let uniqueWords = Set(input.map { $0.lowercased() })
    return Dictionary(uniqueKeysWithValues: uniqueWords.map { ($0, $0.count) })
}

// Вариант 2: Set + reduce(into:)
// Безопаснее, явный контроль над наполнением словаря
func analyzeReduce(_ input: [String]) -> [String: Int] {
    let lowercased = input.map { $0.lowercased() }
    let unique = Set(lowercased)
    return unique.reduce(into: [:]) { result, word in
        result[word] = word.count
    }
}

// MARK: - Пример
let words = ["Swift", "xcode", "Playground", "debug", "compiler", "Swift", "debug"]

print(analyzeUniqueKeys(words))
print(analyzeReduce(words))