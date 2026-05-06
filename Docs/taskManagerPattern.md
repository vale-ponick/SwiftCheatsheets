# 🧠 Архитектура консольного менеджера задач (ValeToDo)

## 🎯 Суть
Разделение программы на:
- **Model** (`struct Task`) — данные задачи
- **Manager** (`class TaskManager`) — логика работы с задачами
- **Main** (`main.swift`) — ввод/вывод и команды пользователя

## 🔥 Ключевые элементы

### 1. Структура задачи
```swift
struct Task {
    let id = UUID()
    let title: String
    var isCompleted: Bool
}
2. Перечисление команд
swift
enum Command: String {
    case addTask = "add task"
    case showAll = "show all tasks"
    // ...
}
3. Класс Manager
add(_:) — добавление

displayAll() — показать все

showCompleted() / showUncompleted() — фильтрация

delete(at:) — удаление по индексу

toggleStatus(at:) — переключение статуса

4. Главный цикл
while true — бесконечное меню

readLine() — ввод команды

Command(rawValue:) — преобразование строки в enum

switch — вызов методов manager

✅ Почему это хорошо
Разделение ответственности (не всё в main)

Типобезопасные команды (enum вместо строк)

Лёгкость расширения (добавил case → добавил метод)

🔆 Использовать для:
Консольных приложений с меню

ToDoList, калькулятора, телефонной книги

Тренировки архитектуры перед перехода к UIKit/SwiftUI

📅 Добавлено: 06.05.2026
👤 Автор: Валерия Поник (vale-ponick)