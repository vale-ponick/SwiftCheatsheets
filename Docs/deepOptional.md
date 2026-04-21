
//  deepOptional.md
//  Created by Валерия Пономарева on 22.04.2026.

# Deep Optional - с англ. "глубокий опционал"

## ⚡️ Суть
Свойство может быть `nil` САМО, а также содержать `nil` ВНУТРИ (`[Int?]`, `[String?]?`).

## 📝 Примеры типов

| Тип | Массив существует? | Элементы могут быть nil? |
|-----|-------------------|--------------------------|
| `[String]` | ✅ | ❌ |
| `[String?]` | ✅ | ✅ |
| `[String?]?` | ❓ может быть nil | ✅ |

## 🛠 Как безопасно работать

### 1. Проверить, существует ли массив
```swift
guard let array = data else { return [] }
2. Убрать nil внутри массива
swift
let cleaned = array.compactMap { $0 }
🔁 Пример из задачи
swift
let nums: [Int?]? = [12, nil, 21, 0, -21]

func sumEven(in nums: [Int?]?) -> Int {
    guard let validArray = nums else { return 0 }
    return validArray
        .compactMap { $0 }
        .filter { $0 % 2 == 0 }
        .reduce(0, +)
}
🔑 Что здесь происходит
Шаг    Код    Что делаем
1    guard let validArray = nums    Проверяем, есть ли массив
2    .compactMap { $0 }    Убираем nil внутри
3    .filter { $0 % 2 == 0 }    Оставляем чётные
4    .reduce(0, +)    Суммируем
🔥 Запоминалка
[Int?]? — сначала проверь массив, потом убирай nil внутри.

🔆 Использовать, когда нужно:
Обработать данные из сети/базы, где массив может отсутствовать

Избежать краша при работе с nil

Понять, почему guard let нужен даже ПОСЛЕ compactMap
