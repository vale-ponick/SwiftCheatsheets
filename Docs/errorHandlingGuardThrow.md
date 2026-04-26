# Обработка ошибок: return, throw и их друзья

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

## 🔁 Пример: return (ваш код)

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
🧠 Запоминалка на одном листе
guard — проверяем вход, чтобы дальше не упасть

if let — развилка, оба пути ведут дальше

return ошибка — сказать "не получилось, сделай так"

throw ошибка — крикнуть "всё сломано, чини!"

✅ Золотое правило
Если ошибка штатная (не заполнено поле) — возвращайте String.
Если ошибка нештатная (нет связи с сервером) — бросайте Error.

📅 Добавлено: 26.04.2026
👤 Автор: vale-ponick

