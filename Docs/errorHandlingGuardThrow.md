# guard, return, throw и преобразование строк в числа

## 🧠 Модель: дороги и КПП

- `return` — съезд с трассы по собственному желанию (штатная ситуация)
- `throw` — принудительная эвакуация с трассы (нештатная ситуация)
- `guard` — КПП: без пропуска (значения) дальше не пускают
- `if let` — выбор маршрута: налево (значение есть) или направо (значения нет)

---

## 📦 Сравнение return vs throw

| | Возврат ошибки (`-> String`) | Выброс ошибки (`throws`) |
|---|-----------------------------|---------------------------|
| Цель | Сообщить о штатном отказе | Сообщить о нештатной ситуации |
| Прерывание | Нет | Да |
| Обработка | Проверка `if` | `do-catch` |
| Пример | `return "Login required"` | `throw AuthError.emptyFields` |

---

## 🧠 Почему Int("строка") возвращает опционал

- `Int("50")` → ✅ получаем `Optional(50)`
- `Int("пять")` → ❌ получаем `nil`

Swift **требует** обработать оба случая через `if let` или `guard let`.  
Если бы `Int()` возвращал обычный `Int`, при ошибке программа бы упала.

> Любое рискованное преобразование → опционал → проверка → безопасность

---

## 🔁 Пример: return (штатная проверка)

```swift
func authenticate(username: String?, password: String?) -> String {
    guard let user = username, !user.isEmpty,
          let pass = password, !pass.isEmpty
    else {
        return "Login and password are required"
    }
    return user == "Gandalf" && pass == "Mellon"
           ? "Access granted"
           : "Invalid credentials"
}
🔥 Пример: throw (профессиональный)
swift
enum AuthError: Error {
    case emptyFields
    case invalidCredentials
}

func authenticate(username: String?, password: String?) throws -> String {
    guard let user = username, !user.isEmpty,
          let pass = password, !pass.isEmpty
    else {
        throw AuthError.emptyFields
    }
    guard user == "Gandalf" && pass == "Mellon" else {
        throw AuthError.invalidCredentials
    }
    return "Access granted"
}

// Вызов
do {
    let result = try authenticate(username: "Gandalf", password: "Mellon")
    print(result)
} catch AuthError.emptyFields {
    print("Fill in all fields")
} catch AuthError.invalidCredentials {
    print("Wrong login or password")
}
🔁 Пример: проверка пользователя с возрастом
swift
func checkUserInput(name: String?, age: String?) -> String {
    guard let userName = name, !userName.isEmpty,
          let userAgeString = age, !userAgeString.isEmpty
    else {
        return "Error: name and age are required"
    }

    guard let userAge = Int(userAgeString) else {
        return "Error: age must be a number"
    }

    guard userAge >= 0 && userAge <= 120 else {
        return "Error: age must be between 0 and 120"
    }

    return "Hello, \(userName)! You are \(userAge) years old."
}
🧠 Запоминалка на одном листе
guard — проверяем вход, чтобы дальше не упасть

if let — развилка, оба пути ведут дальше

return ошибка — сказать «не получилось, сделай так»

throw ошибка — крикнуть «всё сломано, чини!»

Int("строка") — всегда даёт опционал → разворачивай через guard let или if let

✅ Золотое правило
Штатная ошибка (не заполнено поле) → return с сообщением.

Нештатная ошибка (нет связи) → throw Error.

📅 Добавлено: 26.04.2026
👤 Автор: vale-ponick

