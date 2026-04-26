guard let — выход из функции, если условие не выполнено.
Пример: guard let name = name else { return }

func printGreetings(_ input: String?) {
    guard let greeting = input else {
        print("No name")
        return
    }
        print("Hello, \(greeting)!")
}
printGreetings(fullName) // Hello, John Ronald Ruel Tolkien!
