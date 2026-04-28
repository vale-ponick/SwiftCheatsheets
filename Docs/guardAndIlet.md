# guard + if let - с англ. "охранник и разворачивание"

## ⚡️ Суть
- **guard** — проверяем входные данные (nil или пустота). Не прошёл → выход.
- **if let** — безопасно пробуем превратить строку в число. Получилось → одно, нет → другое.

## 📝 Синтаксис

```swift
func describe(score: String?) -> String {
    guard let scoreString = score, !scoreString.isEmpty else {
        return "No score"
    }
    
    if let scoreValue = Int(scoreString) {
        return scoreValue >= 5 ? "High score" : "Low score"
    } else {
        return "NaN"
    }
}
✅ Примеры
Успешный ввод (число)
swift
print(describe(score: "5"))   // "Low score"
print(describe(score: "7"))   // "High score"
Невалидный ввод
swift
print(describe(score: nil))   // "No score"
print(describe(score: ""))    // "No score"
print(describe(score: "abc")) // "NaN"
🔑 Что здесь происходит
Шаг    Конструкция    Что делает
1    guard let    Проверяет, что score не nil и не пустая строка
2    if let    Пытается превратить строку в число (Int?)
3    условие scoreValue >= 5    Если число есть — сравнивает
4    else    Если число не получилось — "NaN"
🧠 Сравнение guard let и if let
guard let    if let
Назначение    Проверить входные данные    Развить логику
Путь при ошибке    Выход из функции    Выполнение else
Где используется    В начале функции    В любом месте
🔥 Запоминалка
guard — КПП: не прошёл — уходи

if let — развилка: число или не число

NaN — строка не стала числом (Not a Number)

🔆 Использовать, когда нужно:
Проверить, что входные данные не nil и не пустые.

Безопасно преобразовать строку в число (Int, Double).

Разветвить логику: число есть / числа нет.

# Temperature Converter — guard + if let / guard

## ⚡️ Суть
Функция конвертации температуры с защитой от `nil` и невалидного ввода.

## 📝 Три стиля решения

### Вариант 1: `if let` + плоский код

```swift
func convertTemperature(input: String?) -> String {
    guard let inputValue = input, !inputValue.isEmpty else { return "No input" }
    
    if let temperature = Double(inputValue) {
        if temperature >= 100 { return "Boiling" }
        if temperature > 0 && temperature < 100 { return "Liquid" }
        return "Freezing"
    } else {
        return "Not a number"
    }
}
Вариант 2: if let + switch
swift
func convertTemp(input: String?) -> String {
    guard let inputValue = input, !inputValue.isEmpty else { return "No input" }
    
    if let temperature = Double(inputValue) {
        switch temperature {
        case 100...: return "Boiling"
        case ..<0: return "Freezing"
        default: return "Liquid"
        }
    } else {
        return "Not a number"
    }
}
Вариант 3: два guard (самый короткий)
swift
func convertTempera(input: String?) -> String {
    guard let inputValue = input, !inputValue.isEmpty else { return "No input" }
    guard let temperature = Double(inputValue) else { return "Not a number" }
    
    if temperature >= 100 { return "Boiling" }
    if temperature <= 0 { return "Freezing" }
    return "Liquid"
}
🔥 Запоминалка
guard — проверка входа (nil, пустота, преобразование)

if let — мягкое разветвление (число / не число)

switch — чистые диапазоны

📅 Добавлено: 28.04.2026
👤 Автор: Валерия Поник (vale-ponick)
