# Method Chaining - с англ. "цепочка методов"

## ⚡️ Суть
Цепочка — пишу несколько методов подряд через точку.  
Результат первого идёт во второй, результат второго — в третий.

## 📝 Синтаксис

let result = array
    .filter { условие }
    .map { преобразование }
    .sorted()
    
✅ Примеры
Базовый — из задачи 3

let words = ["swift", "xcode", "playground", "debug", "compiler"]

let result = words
    .filter { $0.count > 5 }
    .map { $0.uppercased() }
    .sorted()

print(result) // ["COMPILER", "PLAYGROUND"]

С числами

let numbers = [3, 7, 0, -5, 8, -2, 10, -1, 4]

let result = numbers
    .filter { $0 % 2 == 0 }
    .map { $0 * $0 }

print(result) // [0, 64, 4, 100, 16]

🧩 Готовый кейс: очистка + фильтр + тернарник + сортировка

let dirtyArray = ["", "Swift", "  ", "iOS", " Dev ", "", "Closure"]

let cleaned = dirtyArray
    .map { $0.trimmingCharacters(in: .whitespaces) }
    .filter { !$0.isEmpty }
    .map { $0.count <= 4 ? "short" : "long" }
    .sorted()

print(cleaned) // ["long", "long", "short", "short"]

🔑 Что здесь происходит?
Шаг    Метод                    Результат
1    .map { trimming... }       Убираем пробелы по краям
2    .filter { !isEmpty }       Отбрасываем пустые строки
3    .map { ... ? ... : ... }   Превращаем длину в "short" или "long"
4    .sorted()                  Сортируем по алфавиту

🔥 Запоминалка
Чистим → Фильтруем → Преобразуем → Сортируем
