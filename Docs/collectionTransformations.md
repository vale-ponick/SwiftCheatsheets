# Преобразование коллекций: словари из массивов

## 🎯 Суть

Из массива строк нужно получить словарь: **слово → его длина**, убрав дубликаты и игнорируя регистр.

## 📦 Исходные данные

```swift
let words = ["Swift", "xcode", "Playground", "debug", "compiler", "Swift", "debug"]
⚡️ Вариант 1: Dictionary(uniqueKeysWithValues:)
swift
func analyze1(_ input: [String]) -> [String: Int] {
    let unique = Set(input.map { $0.lowercased() })
    return Dictionary(uniqueKeysWithValues: unique.map { ($0, $0.count) })
}
Как работает:

input.map { $0.lowercased() } → все слова в нижний регистр

Set(...) → убираем дубликаты

.map { ($0, $0.count) } → превращаем каждое слово в кортеж (слово, длина)

Dictionary(...) → собираем кортежи в словарь

⚠️ Важно: uniqueKeysWithValues упадёт при дубликатах ключей. Поэтому сначала обязателен Set.

🔁 Вариант 2: reduce(into:)
swift
func analyze2(_ input: [String]) -> [String: Int] {
    let lowercased = input.map { $0.lowercased() }
    let unique = Set(lowercased)
    
    return unique.reduce(into: [:]) { result, word in
        result[word] = word.count
    }
}
Как работает:

lowercased → массив слов в нижнем регистре

Set → убираем дубликаты

.reduce(into: [:]) → в пустой словарь кладём слово: длина

Плюс: не нужно беспокоиться о дубликатах ключей.

📊 Сравнение
Критерий	uniqueKeysWithValues	reduce(into:)
Длина кода	короче	чуть длиннее
Читаемость для новичка	⚠️ средняя	✅ высокая
Безопасность (дубликаты)	❌ упадёт	✅ корректно перезапишет
✅ Запоминалка
Массив → нижний регистр → множество → словарь.

Dictionary(uniqueKeysWithValues:) — для гарантированно уникальных ключей.

reduce(into:) — для любого случая, более «ручной» контроль.

📅 Добавлено: 04.05.2026
👤 Автор: Валерия Поник (vale-ponick)