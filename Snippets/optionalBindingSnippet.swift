//
//  optionalBindingSnippet.swift
//  
//
//  Created by Валерия Пономарева on 23.04.2026.
//
import Foundation

// MARK: - Optional binding (if let, guard let, compactMap)

// if let
func checkName(_ name: String?) -> String {
    if let unwrapped = name {
        return "Hello, \(unwrapped)"
    } else {
        return "Name is nil"
    }
}

// guard let + проверка на пустую строку
func printGreeting(_ name: String?) {
    guard let name = name, !name.isEmpty else {
        print("No name provided")
        return
    }
    print("Hello, \(name)")
}

// Несколько опционалов
func createFullName(_ firstName: String?, _ lastName: String?) -> String {
    let f = firstName?.trimmingCharacters(in: .whitespaces) ?? ""
    let l = lastName?.trimmingCharacters(in: .whitespaces) ?? ""
    let nonEmpty = [f, l].filter { !$0.isEmpty }
    guard !nonEmpty.isEmpty else { return "Unknown" }
    return nonEmpty.joined(separator: " ")
}

// compactMap (убираем nil из массива)
func calculateAverage(scores: [Int?]) -> Double? {
    let validScores = scores.compactMap { $0 }
    guard !validScores.isEmpty else { return nil }
    let sum = validScores.reduce(0, +)
    return Double(sum) / Double(validScores.count)
}

// Примеры
print(checkName("Spock"))         // Hello, Spock
printGreeting("Spock")            // Hello, Spock
print(createFullName("Valeria", "Ponomareva")) // Valeria Ponomareva
print(calculateAverage(scores: [98, nil, 85, 92]) ?? 0) // 91.66
