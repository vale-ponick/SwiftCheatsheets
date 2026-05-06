## 🔧 **Сниппет `Snippets/TaskManagerSnippet.swift`**

import Foundation

// вар. 1 simple

struct Task {
    let title: String
    var isCompleted: Bool
}
var tasks: [Task] = []

func displayAllTasks() {
    print("Current tasks:")
    for (index, task) in tasks.enumerated() {
        let status = task.isCompleted ? "✅" : "❌"
        print("\(index + 1). \(status) \(task.title)")
    }
}

while true {
    print("print menu:")
    
    guard let input = readLine(), input != "exit" else { break }
    
    switch input {
    case "add task":
        print("enter title: ")
        guard let title = readLine(), !title.isEmpty else {
            print("❌ Error!")
            continue
        }
        let task = Task(title: title, isCompleted: false)
        tasks.append(task)
        print("Task added")
        
    case "show all task":
        if tasks.isEmpty {
            print("List of tasks empty")
        } else {
            for (index, task) in tasks.enumerated() {
                let status = task.isCompleted ? "✅" : "❌"
                print("\(index + 1). \(status) \(task.title)")
            }
        }
        
    case "show complete tasks":
        let cleanedTasks = tasks.filter { $0.isCompleted }
        if cleanedTasks.isEmpty {
            print("No completed tasks")
        } else {
            for (index, task) in cleanedTasks.enumerated() {
                print("\(index + 1). ✅ \(task.title)")
            }
        }
        
    case "show uncompleted tasks":
        let uncompleted = tasks.filter { !$0.isCompleted }
        if uncompleted.isEmpty {
            print("No uncompleted tasks")
        } else {
            for (index, task) in uncompleted.enumerated() {
                print("\(index + 1). ❌ \(task.title)")
            }
        }
        
    case "delete task":
        if tasks.isEmpty {
            print("No task to delete")
        } else {
            displayAllTasks()
            print("Enter number of task: ")
            guard let number = readLine(), let intNumber = Int(number) else { continue }
            if intNumber >= 1 && intNumber <= tasks.count {
                tasks.remove(at: intNumber - 1)
                print("Task deleted")
            } else {
                print("Invalid number")
            }
        }
        
    case "change status":
        if tasks.isEmpty {
            print("No task to change status")
        } else {
            displayAllTasks()
            print("Enter number of task: ")
            guard let number = readLine(), let intNumber = Int(number) else { continue }
            if intNumber >= 1 && intNumber <= tasks.count {
                tasks[intNumber - 1].isCompleted.toggle()
                print("Status changed")
            } else {
                print("Invalid number")
            }
        }
        
    default:
        print("incorrect command")
    }
}

// var. 2 profi

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

// вар. 3 свифтово + кратко!

📄 Файл: TaskManagerSnippet_Short.swift
swift
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
    
    func add(_ title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return print("❌ Empty title") }
        tasks.append(Task(title: trimmed, isCompleted: false))
        print("✅ Added: \"\(trimmed)\"")
    }
    
    private func printTasks(_ tasks: [Task], title: String, emoji: String) {
        guard !tasks.isEmpty else { return print("📭 \(title)") }
        print("\n\(title):")
        tasks.enumerated().forEach { index, task in
            print("\(index + 1). \(emoji) \"\(task.title)\"")
        }
    }
    
    func displayAll() {
        printTasks(tasks, title: "📋 All tasks", emoji: tasks.first?.isCompleted == true ? "✅" : "❌")
    }
    
    func showCompleted() {
        printTasks(tasks.filter { $0.isCompleted }, title: "✅ Completed tasks", emoji: "✅")
    }
    
    func showUncompleted() {
        printTasks(tasks.filter { !$0.isCompleted }, title: "❌ Uncompleted tasks", emoji: "❌")
    }
    
    func delete(at index: Int) -> Bool {
        guard tasks.indices.contains(index) else { return false }
        let removed = tasks.remove(at: index)
        print("🗑️ Deleted: \"\(removed.title)\"")
        return true
    }
    
    func toggleStatus(at index: Int) -> Bool {
        guard tasks.indices.contains(index) else { return false }
        tasks[index].isCompleted.toggle()
        let status = tasks[index].isCompleted ? "✅" : "❌"
        print("🔄 Status changed to \(status): \"\(tasks[index].title)\"")
        return true
    }
    
    func isEmpty() -> Bool { tasks.isEmpty }
}

// MARK: - Основная программа
let manager = TaskManager()

print("""
Commands:
  ➕ add task
  👁️ show all tasks
  ✅ show completed tasks
  ❌ show uncompleted tasks
  🗑️ delete task
  🔄 change status
  🚪 exit
""")

while true {
    print("\n> ", terminator: "")
    guard let input = readLine()?.trimmingCharacters(in: .whitespaces), !input.isEmpty else { continue }
    
    if input == "exit" {
        print("👋 Goodbye!")
        break
    }
    
    guard let command = Command(rawValue: input) else {
        print("❌ Unknown command: \"\(input)\"")
        continue
    }
    
    switch command {
    case .addTask:
        print("📝 Enter title: ", terminator: "")
        guard let title = readLine()?.trimmingCharacters(in: .whitespaces), !title.isEmpty else {
            print("❌ Title cannot be empty")
            continue
        }
        manager.add(title)
        
    case .showAll:
        manager.displayAll()
        
    case .showCompleted:
        manager.showCompleted()
        
    case .showUncompleted:
        manager.showUncompleted()
        
    case .deleteTask, .changeStatus:
        guard !manager.isEmpty() else {
            print("📭 No tasks")
            continue
        }
        manager.displayAll()
        print(command == .deleteTask ? "🗑️ Delete number: " : "🔄 Change number: ", terminator: "")
        guard let input = readLine(), let num = Int(input), (1...manager.tasks.count).contains(num) else {
            print("❌ Invalid number")
            continue
        }
        if command == .deleteTask {
            _ = manager.delete(at: num - 1)
        } else {
            _ = manager.toggleStatus(at: num - 1)
        }
    }
}
