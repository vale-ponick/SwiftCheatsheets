//
//  Untitled.swift
//  
//
//  Created by Валерия Пономарева on 23.04.2026.
//
import Foundation

// MARK: - Deep Optional [Int?]?

/// Суммирует чётные числа из опционального массива опционалов
func sumEven(in nums: [Int?]?) -> Int {
    guard let validArray = nums else { return 0 }
    return validArray
        .compactMap { $0 }
        .filter { $0 % 2 == 0 }
        .reduce(0, +)
}

/// Альтернативная версия с печатью для отладки
func sumEvenDebug(in nums: [Int?]?) -> Int {
    guard let array = nums else {
        print("❌ Массив отсутствует (nil)")
        return 0
    }
    
    let valid = array.compactMap { $0 }
    let even = valid.filter { $0 % 2 == 0 }
    let sum = even.reduce(0, +)
    
    print("Исходный массив: \(String(describing: nums))")
    print("После compactMap: \(valid)")
    print("Чётные: \(even)")
    print("Сумма: \(sum)")
    
    return sum
}

// Примеры
let numbers: [Int?]? = [12, nil, 21, 0, -21]
print(sumEven(in: numbers)) // 12

let nilArray: [Int?]? = nil
print(sumEven(in: nilArray)) // 0
