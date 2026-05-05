## 🔧 **Сниппет: `SafeSwapSnippet.swift`**

```swift
import Foundation

// MARK: - Безопасная перестановка двух элементов в массиве

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

// MARK: - Примеры использования

let headers = ["id", "name", "email", "birthDate", "isActive"]

print(swapElements(in: headers, from: 1, to: 3) ?? []) // ["id", "birthDate", "email", "name", "isActive"]
print(swapElements(in: headers, from: 2, to: 2) ?? []) // ["id", "name", "email", "birthDate", "isActive"]
print(swapElements(in: headers, from: 0, to: 7) ?? []) // []
print(swapElements(in: [], from: 0, to: 1) ?? [])       // []