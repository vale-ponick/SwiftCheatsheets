📄 # Сравнение двух опционалов: if‑else vs switch

## 🎯 Суть
Нужно сравнить два числа, которые могут быть `nil`.

---

## ⚡️ Решение 1: if‑else (знакомый путь)

```swift
func compareNumbers(_ a: Int?, _ b: Int?) -> String {
    if a == nil && b == nil {
        return "Both nil"
    } else if a == nil, b != nil {
        return "First nil, second = \(b!)"
    } else if a != nil, b == nil {
        return "First = \(a!), second nil"
    } else {
        if a == b { return "Equal (\(a!))" }
        return a! > b! ? "First > Second (\(a!) > \(b!))" : "First < Second (\(a!) < \(b!))"
    }
}
Плюсы: понятный, порог входа низкий.
Минусы: нужно использовать ! (принудительное извлечение), легко пропустить вариант.

🔥 Решение 2: switch (свифтовый стиль)
swift
func compareNumbers(_ a: Int?, _ b: Int?) -> String {
    switch (a, b) {
    case (nil, nil):
        return "Both nil"
    case (nil, .some(let b)):
        return "First nil, second = \(b)"
    case (.some(let a), nil):
        return "First = \(a), second nil"
    case (.some(let a), .some(let b)):
        if a == b { return "Equal (\(a))" }
        return a > b ? "First > Second (\(a) > \(b))" : "First < Second (\(a) < \(b))"
    }
}
Плюсы:

✅ нет ! — безопасно

✅ все варианты явно перечислены

✅ компилятор проверит полноту

🧠 Ключевое: что такое .some(let a)
Опционал — это коробка, которая может быть:

.none (пустая) — соответствует nil

.some(value) — в коробке лежит значение

.some(let a) — паттерн, который одновременно:

Проверяет, что коробка не пуста

Достаёт значение и кладёт его в константу a

Внутри этого кейса a уже обычный Int, не Int?.

📊 Сравнение подходов
Критерий	if‑else	switch
Безопасность (нет !)	❌	✅
Явные все ветки	❌	✅
Проверка компилятором	❌	✅
Простота для новичка	✅	⚠️
🔆 Использовать, когда нужно:
сравнить два опционала

разобрать несколько сценариев с nil

написать код, который легко расширять

📅 Добавлено: 03.05.2026
👤 Автор: Валерия Поник (vale-ponick)