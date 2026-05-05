# Безопасная перестановка двух элементов в массиве

## 🎯 Суть
Поменять местами элементы по заданным индексам, не выходя за границы и не изменяя исходный массив.

## 📝 Шаблон функции

```swift
func swapElements<T>(in array: [T], from first: Int, to second: Int) -> [T]? {
    guard !array.isEmpty else { return nil }
    guard first >= 0 && first < array.count,
          second >= 0 && second < array.count else { return nil }
    
    if first == second { return array }
    
    var copy = array
    copy[first] = array[second]
    copy[second] = array[first]
    return copy
}
✅ Ключевые моменты
guard для проверки пустоты и границ

копирование перед изменением (var copy = array)

возврат nil при ошибках вместо краша

🧪 Примеры
swift
let data = ["A", "B", "C", "D"]
swapElements(in: data, from: 0, to: 3) // ["D", "B", "C", "A"]
swapElements(in: data, from: 0, to: 0) // ["A", "B", "C", "D"]
swapElements(in: data, from: 0, to: 5) // nil
swapElements(in: [], from: 0, to: 0)   // nil
🔆 Использовать, когда нужно:
безопасно менять местами строки в таблице

переставлять поля в анкете

тренировать работу с индексами