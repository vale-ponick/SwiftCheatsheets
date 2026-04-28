print("🧩 Задача guard vs if let: Напиши функцию, которая: Использует guard, чтобы проверить, что все три параметра не nil: customer — имя клиента, items — количество товаров, price — цена за один товар. Если хотя бы один параметр nil → вернуть 'Invalid order: missing data'. После guard используй if (или if let уже не нужен, потому что мы уже развернули опционалы), чтобы проверить: items не отрицательный, price не отрицательный. Если что-то отрицательное → вернуть 'Invalid order: negative values not allowed'. Если все проверки пройдены → вернуть строку: 'Order for <customer>: <items> items, total price: <items * price>', Сумму округли до двух знаков после запятой.")
      
      /* ✅ Что ты тренируешь?
        - guard для проверки nil — как только находим nil, сразу выходим.
        - if для логических проверок значений — числа есть, но они могут быть неподходящими.
       Разницу: guard — для критических ошибок (без них не имеем права продолжать), if — для бизнес-логики. */

func processOrder(customer: String?, items: Int?, price: Double?) -> String {
    // 1. Проверяем, что все параметры не nil
    guard let customer, let items, let price else { // guard отвечает за наличие данных
        return "Invalid order: missing data" // ✅ если любой nil → выход
    }
    // 2. Проверяем отрицательные значения
    if items < 0 || price < 0 { // if — за корректность данных
        return "Invalid order: negative values not allowed" //     ✅ если отрицательные → выход
    }
    // 3. все ОК - считаем сумму
    let total = Double(items) * price
    return "Order for \(customer): \(items) items, total price: \(String(format: "%.2f", total))"
}
print(processOrder(customer: "vale.ponick", items: 3, price: 12.12))
// Order for vale.ponick: 3 items, total price: 36.36

print(processOrder(customer: nil, items: 2, price: 21.21))
// Invalid order: missing data

print(processOrder(customer: "vale.ponick", items: -7, price: -7.77))
// Invalid order: negative values not allowed

print("🧩 Задача: check Stock: Напиши функцию, которая: guard — проверяет, что ни один из параметров не nil. Если есть nil → вернуть 'Missing data: product, quantity or price is nil'. if — проверяет, что quantity больше 0 и price больше 0. Если нет → вернуть 'Invalid values: quantity and price must be positive'. Если всё ок → вернуть строку: 'Product: <product>. Available: <quantity> pcs. Total value: <quantity * price> RUB'. Сумму округли до двух знаков.")

func checkStock(product: String?, quantity: Int?, price: Double?) -> String {
    // 1. Проверяем, что все параметры не nil
    guard let product, let quantity, let price else {
        return "Missing data: product, quantity or price is nil"
    }
    // 2. Проверяем отрицательные значения
    if quantity <= 0 || price <= 0 {
        return "Invalid values: quantity and price must be positive"
    }
        // 3. все ОК - считаем сумму
        let totalValue = Double(quantity) * price
        return "Product: \(product). Available: \(quantity) pcs. Total value: \(String(format: "%.2f", totalValue)) RUB"
}
print(checkStock(product: nil, quantity: -3, price: 777.7)) // Missing data: product, quantity or price is nil
print(checkStock(product: "Milk", quantity: 3, price: -112)) // Invalid values: quantity and price must be positive
print(checkStock(product: "Bred", quantity: 2, price: 52)) // Product: Bred. Available: 2 pcs. Total value: 104.00 RUB
