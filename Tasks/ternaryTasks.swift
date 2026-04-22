//
//  ternaryTasks.swift
//  
//
//  Created by Валерия Пономарева on 23.04.2026.
//
# Задачи на тернарный оператор

## Задача 1
Напиши функцию, которая принимает два числа и возвращает "positive", "negative" или "mixed".

**Решение:**
```swift
func signDescription(a: Int, b: Int) -> String {
    return a > 0 && b > 0 ? "positive" :
           a <= 0 && b <= 0 ? "negative" : "mixed"
}
