//  SecondWordSnippet.swift
//  SwiftCheats
//
//  Created by Валерия Пономарева on 24.04.2026.
//

import Foundation

// MARK: - Получение второго слова из строки

/// Вариант 1: классический, с проверкой count
func printSecondWord(_ name: String?) {
    guard let name = name else {
        print("no second word")
        return
    }
    let components = name.components(separatedBy: " ")
    if components.count >= 2 {
        print(components[1])
    } else {
        print("no second word")
    }
}

/// Вариант 2: функциональный, с dropFirst().first
func displaySecondWord(_ name: String?) {
    guard let name = name else {
        print("no second word")
        return
    }
    let components = name.split(separator: " ")
    if let second = components.dropFirst().first {
        print(second)
    } else {
        print("no second word")
    }
}

// Примеры вызова (для проверки)
// printSecondWord("John Ronald Reuel Tolkien") // Ronald
// displaySecondWord("Jane Austen")             // Austen
// printSecondWord(nil)                         // no second word