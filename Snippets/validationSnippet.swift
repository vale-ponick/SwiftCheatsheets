import Foundation

// MARK: - Валидация пользователя (имя, возраст)
func checkUserInput(name: String?, age: String?) -> String {
    guard let name = name, !name.isEmpty,
          let ageString = age, !ageString.isEmpty
    else { return "Error: name and age are required" }
    
    guard let age = Int(ageString), age >= 0, age <= 111
    else { return "Error: age must be a number between 0 and 111" }
    
    return "Hi, \(name)! You are \(age) years old"
}

// MARK: - Обработка заказа
func processOrder(customer: String?, items: Int?, price: Double?) -> String {
    guard let customer, let items, let price
    else { return "Invalid order: missing data" }
    
    guard items >= 0, price >= 0
    else { return "Invalid order: negative values not allowed" }
    
    let total = Double(items) * price
    return "Order for \(customer): \(items) items, total price: \(String(format: "%.2f", total))"
}

// MARK: - Проверка склада
func checkStock(product: String?, quantity: Int?, price: Double?) -> String {
    guard let product, let quantity, let price
    else { return "Missing data: product, quantity or price is nil" }
    
    guard quantity > 0, price > 0
    else { return "Invalid values: quantity and price must be positive" }
    
    let total = Double(quantity) * price
    return "Product: \(product). Available: \(quantity) pcs. Total value: \(String(format: "%.2f", total)) RUB"
}