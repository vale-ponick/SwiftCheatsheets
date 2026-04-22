//
//  dataCleanSnippet.swift
//  
//
//  Created by Валерия Пономарева on 23.04.2026.
//
import Foundation

// MARK: - Паттерн очистки строк

let dirtyArray = ["", "Swift", "  ", "iOS", " Dev ", "", "Closure"]

// Очистка → фильтрация → классификация → сортировка
let cleaned = dirtyArray
    .map { $0.trimmingCharacters(in: .whitespaces) }
    .filter { !$0.isEmpty }
    .map { $0.count <= 4 ? "short" : "long" }
    .sorted()

print(cleaned) // ["long", "long", "short", "short"]

// Более сложный вариант: проверка на буквы + приоритетная сортировка
let data = [" hello ", "world", " Swift ", "  ", "iOS", " Dev ", "", "   ", "cLOSURE"]

let classified = data
    .map { $0.trimmingCharacters(in: .whitespaces) }
    .filter { !$0.isEmpty }
    .map { $0.allSatisfy { $0.isLetter } ?
        ($0.count < 5 ? "shortWord" : "longWord") : "notWord" }
    .sorted {
        let priority: [String: Int] = ["shortWord": 0, "longWord": 1, "notWord": 2]
        return priority[$0, default: 3] < priority[$1, default: 3]
    }

print(classified) // ["shortWord", "longWord", "longWord", "longWord", "longWord"]
