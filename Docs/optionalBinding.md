# Optional Binding - с англ. "опциональная привязка"

## ⚡️ Суть
Безопасное извлечение значения из опционала без использования `!`.

## 📝 Синтаксис

### `if let`

if let name = optionalName {
    print("Hello, \(name)")
} else {
    print("Name is nil")
}

guard let

guard let name = optionalName else {
    print("Name is nil")
    return
}
print("Hello, \(name)")

✅ Примеры из задач
Задача 1: if let

func checkName(_ name: String?) -> String {
    if let unwrapped = name {
        return "Hello, \(unwrapped)"
    } else {
        return "Name is nil"
    }
}
Задача 2: guard let + проверка на пустую строку

func printGreeting(_ name: String?) {
    guard let name = name, !name.isEmpty else {
        print("No name provided")
        return
    }
    print("Hello, \(name)")
}
Задача 3: несколько опционалов

func createFullName(_ firstName: String?, _ lastName: String?) -> String {
    let f = firstName?.trimmingCharacters(in: .whitespaces) ?? ""
    let l = lastName?.trimmingCharacters(in: .whitespaces) ?? ""
    let nonEmpty = [f, l].filter { !$0.isEmpty }
    guard !nonEmpty.isEmpty else { return "Unknown" }
    return nonEmpty.joined(separator: " ")
}
Задача 4: compactMap (убираем nil из массива)

func calculateAverage(scores: [Int?]) -> Double? {
    let validScores = scores.compactMap { $0 }
    guard !validScores.isEmpty else { return nil }
    let sum = validScores.reduce(0, +)
    return Double(sum) / Double(validScores.count)
}

🔑 Что здесь происходит?
Метод           Что делает
if let          Распаковывает опционал внутри блока
guard let       Распаковывает и продолжает выполнение, иначе выход
compactMap      Убирает nil из массива
??              Заменяет nil на значение по умолчанию

🔥 Запоминалка
if let → если есть, делаем; если нет — идём дальше

guard let → если нет — выходим; если есть — работаем

compactMap → массив с nil превращаем в массив без nil

## 🔥 Печать опциональных значений

### 💡 Проблема
Функция возвращает `Double?`, а `print` выводит `Optional(85.75)` или `nil` некрасиво.

### 🔧 Решение: оператор `??`

```swift
let result: Double? = calculateAverage(...)
print(result ?? "nil")
📊 Как это работает
Что в result    Напечатает
85.75    85.75
nil    "nil"
⚠️ Альтернативы
swift
// 1. Опасно — краш, если nil 💥
print(result!)

// 2. Безопасно, но длинно 🐢
if let value = result {
    print(value)
} else {
    print("nil")
}

// 3. Лучший вариант — коротко и безопасно 🚀
print(result ?? "nil")

🔥 Запоминалка
?? — если есть, покажи число; если нет — покажи "nil"

## 🔥 Получение второго элемента из строки

### Задача
На вход приходит `String?` со словами через пробел. Нужно напечатать 'второй элемент' (индекс 1).

### 🤔 Решение (классическое)

func printSecondWord(_ name: String?) {
    guard let name = name else { return }
    let parts = name.components(separatedBy: " ")
    if parts.count >= 2 {
        print(parts[1])
    } else {
        print("no second word")
    }
}

🤔 Решение (функциональное)

func displaySecondWord(_ name: String?) {
    guard let name = name else { return }
    let parts = name.split(separator: " ")
    if let second = parts.dropFirst().first {
        print(second)
    } else {
        print("no second word")
    }
}
✅ Что здесь важно
    1. guard let — защита от nil
    2. components(separatedBy: " ") — разбивает строку по пробелам
    3. dropFirst().first — безопасный способ взять второй элемент без проверки count

🔥 Запоминалка
dropFirst().first = возьми второй элемент, не бойся nil

⚠️  if let second = components.dropFirst().first {
    print(second)
}
components.dropFirst() — отбрасывает первый элемент ("John"), оставляя ["Ronald", "Reuel", "Tolkien"].

.first — берёт первый элемент из ЭТОГО нового массива, то есть "Ronald". И возвращает его как опционал (Optional("Ronald")).

if let second = ... — безопасно извлекает это значение. Если исходный массив components был пуст или в нём был только один элемент, то после dropFirst() массив станет пустым, .first вернёт nil, и условие if let не сработает.

⚡️ В чём суть?
dropFirst().first — это способ безопасно получить второй элемент оригинального массива, не проводя отдельную проверку components.count >= 2.

🔆 Использовать, когда нужно:
    1. безопасно работать с опционалами
    2. избежать принудительного извлечения (!)
    3. обработать nil без крэша


