# Ternary Operator - с англ. "тернарный оператор"

## ⚡️ Суть
Короткая замена `if-else` для выбора одного из двух значений.

## 📝 Синтаксис
`let result = condition ? valueIfTrue : valueIfFalse`

## ✅ Примеры

### Простой

let age = 18
let status = age >= 18 ? "Adult" : "Child"

Вложенный (три варианта) — из задачи 2

func orderDescription(a: Int, b: Int, c: Int) -> String {
    return a < b && b < c ? "ascending" :
           a > b && b > c ? "descending" : "mixed"
}

Вложенный с числами — из задачи 1

func signDescription(a: Int, b: Int) -> String {
    return a > 0 && b > 0 ? "positive" :
           a <= 0 && b <= 0 ? "negative" : "mixed"
}

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
Условие ? Да : Нет

🔆 Чистим → Фильтруем → Преобразуем → Сортируем

