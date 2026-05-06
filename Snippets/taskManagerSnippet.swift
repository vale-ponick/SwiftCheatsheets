## 🔧 **Сниппет `Snippets/TaskManagerSnippet.swift`**

```swift
import Foundation

// MARK: - Модель
struct Task {
    let id = UUID()
    let title: String
    var isCompleted: Bool
}

// MARK: - Команды
enum Command: String {
    case addTask = "add task"
    case showAll = "show all tasks"
    case showCompleted = "show completed tasks"
    case showUncompleted = "show uncompleted tasks"
    case deleteTask = "delete task"
    case changeStatus = "change status"
}

// MARK: - Менеджер задач
class TaskManager {
    private(set) var tasks: [Task] = []
    
    func add(_ title: String) { /* реализация */ }
    func displayAll() { /* ... */ }
    func showCompleted() { /* ... */ }
    func showUncompleted() { /* ... */ }
    func delete(at index: Int) -> Bool { /* ... */ }
    func toggleStatus(at index: Int) -> Bool { /* ... */ }
    func isEmpty() -> Bool { tasks.isEmpty }
}
(Полный код можешь взять из своего main.swift, убрав комментарии и print.)