# ✨ Data Cleaning Pattern - с англ. "паттерн очистки данных"

## ⚡️ Суть
Паттерн для обработки строк:  
**Очистка → Фильтрация → Классификация → Сортировка с приоритетом**

## 📝 Синтаксис (общий вид)

let result = data
    .map { $0.trimmingCharacters(in: .whitespaces) }
    .filter { !$0.isEmpty }
    .map { $0.allSatisfy { $0.isLetter } ?
        ($0.count < 5 ? "shortWord" : "longWord") : "notWord" }
    .sorted {
        let priority: [String: Int] = ["shortWord": 0, "longWord": 1, "notWord": 2]
        return priority[$0, default: 3] < priority[$1, default: 3]
    }
✅ Пример из задачи 4

let data = [" hello ", "world", " Swift ", "  ", "iOS", " Dev ", "", "   ", "cLOSURE"]

let result = data
    .map { $0.trimmingCharacters(in: .whitespaces) }
    .filter { !$0.isEmpty }
    .map { $0.allSatisfy { $0.isLetter } ?
        ($0.count < 5 ? "shortWord" : "longWord") : "notWord" }
    .sorted {
        let priority: [String: Int] = ["shortWord": 0, "longWord": 1, "notWord": 2]
        return priority[$0, default: 3] < priority[$1, default: 3]
    }

print(result) // ["shortWord", "longWord", "longWord", "longWord", "longWord"]

🔑 Что здесь происходит?

Шаг    Метод                    Результат
1    .map { trimming... }       Убираем пробелы по краям
2    .filter { !isEmpty }       Отбрасываем пустые строки
3    .map { ... ? ... : ... }   Проверяем буквы, классифицируем
4    .sorted { priority }       Сортируем: shortWord → longWord → notWord

🔥 Запоминалка
Чистим → Фильтруем → Классифицируем → Сортируем

🔆 Использовать, когда нужно:
    1. Обработать строки из пользовательского ввода
    2. Отбросить пустые и строки из пробелов
    3. Отделить слова от мусора (notWord)
    4. Отсортировать результаты в нужном порядке
