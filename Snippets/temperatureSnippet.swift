//  TemperatureSnippet.swift
//  Три способа конвертации температуры (guard / if let)

import Foundation

// MARK: - Вариант 1: if let + плоский код
func convertTemperature(input: String?) -> String {
    guard let inputValue = input, !inputValue.isEmpty else { return "No input" }
    
    if let temperature = Double(inputValue) {
        if temperature >= 100 { return "Boiling" }
        if temperature > 0 && temperature < 100 { return "Liquid" }
        return "Freezing"
    } else {
        return "Not a number"
    }
}

// MARK: - Вариант 2: if let + switch
func convertTemp(input: String?) -> String {
    guard let inputValue = input, !inputValue.isEmpty else { return "No input" }
    
    if let temperature = Double(inputValue) {
        switch temperature {
        case 100...: return "Boiling"
        case ..<0: return "Freezing"
        default: return "Liquid"
        }
    } else {
        return "Not a number"
    }
}

// MARK: - Вариант 3: два guard (самый короткий)
func convertTempera(input: String?) -> String {
    guard let inputValue = input, !inputValue.isEmpty else { return "No input" }
    guard let temperature = Double(inputValue) else { return "Not a number" }
    
    if temperature >= 100 { return "Boiling" }
    if temperature <= 0 { return "Freezing" }
    return "Liquid"
}

// MARK: - Примеры вызова
print(convertTemperature(input: "100"))   // Boiling
print(convertTemperature(input: "36.6"))  // Liquid
print(convertTemperature(input: "0"))     // Freezing
print(convertTemperature(input: "abc"))   // Not a number
print(convertTemperature(input: ""))      // No input
print(convertTemperature(input: nil))     // No input