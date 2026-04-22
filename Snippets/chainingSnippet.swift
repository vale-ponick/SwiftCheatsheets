//
//  chainingSnippet.swift
//  
//
//  Created by Валерия Пономарева on 23.04.2026.
//
import Foundation

// MARK: - Цепочки filter, map, sorted

let words = ["swift", "xcode", "playground", "debug", "compiler"]

// Оставляем слова длиннее 5 → заглавные → сортируем
let result = words
    .filter { $0.count > 5 }
    .map { $0.uppercased() }
    .sorted()

print(result) // ["COMPILER", "PLAYGROUND"]

// Числа: чётные → возводим в квадрат
let numbers = [3, 7, 0, -5, 8, -2, 10, -1, 4]
let squares = numbers
    .filter { $0 % 2 == 0 }
    .map { $0 * $0 }

print(squares) // [0, 64, 4, 100, 16]
