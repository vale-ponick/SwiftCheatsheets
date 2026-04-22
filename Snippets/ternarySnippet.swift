//
//  ternarySnippet.swift
//  
//
//  Created by Валерия Пономарева on 23.04.2026.
//
import Foundation

// MARK: - Тернарный оператор

/// Проверяет два числа и возвращает "positive", "negative" или "mixed"
func signDescription(a: Int, b: Int) -> String {
    return a > 0 && b > 0 ? "positive" :
           a <= 0 && b <= 0 ? "negative" : "mixed"
}

/// Проверяет три числа на возрастание/убывание
func orderDescription(a: Int, b: Int, c: Int) -> String {
    return a < b && b < c ? "ascending" :
           a > b && b > c ? "descending" : "mixed"
}

// Примеры
print(signDescription(a: 12, b: 21)) // positive
print(orderDescription(a: 12, b: 21, c: 33)) // ascending
