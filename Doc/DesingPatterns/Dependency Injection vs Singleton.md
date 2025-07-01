# 📘 Dependency Injection vs Singleton — Swift Concurrency Best Practices

## ✅ Что нужно выучить

| Практика                                              | Почему это важно                                                          |
| ----------------------------------------------------- | ------------------------------------------------------------------------- |
| 🔹 **Используй DI или Singleton, но не оба**          | Упрощает контроль зависимостей и улучшает тестируемость                   |
| 🔹 **Внедряй зависимости через протоколы**            | Позволяет легко подменить реализацию (Mock, Stub, Test, etc.)             |
| 🔹 **Протокол + actor → используй `@preconcurrency`** | Подавляет ворнинги при безопасном использовании actor через протокол      |
| 🔹 **Не делай `DashboardStorageService` актором**     | Акторы не должны содержать другие акторы напрямую — это нарушает изоляцию |
| 🔹 **Храни только `Sendable` зависимости в actor**    | Исключает гонки данных и предупреждения компилятора                       |
| 🔹 **Вынеси `.shared` в Composition Root**            | Позволяет прозрачно управлять жизненным циклом и облегчает тестирование   |
| 🔹 **Пиши `Sendable` протоколы для DI с actor/задач** | Это делает намерения явными и избавляет от ворнингов                      |

---

## ❌ Как не надо делать

### ❌ Singleton + DI вместе

```swift
final class SomeService {
    private let storage: MyStorage

    init(storage: MyStorage = .shared) { // ❌ DI и singleton одновременно
        self.storage = storage
    }
}
```

---

### ❌ Жёсткая зависимость от конкретного типа

```swift
final class Manager {
    private let logger: DefaultLogger // ❌

    init(logger: DefaultLogger) {
        self.logger = logger
    }
}
```

---

### ❌ actor содержит другой actor

```swift
actor A {
    let b = B() // ❌ actor внутри actor
}
```

---

### ❌ `@unchecked Sendable` без анализа

```swift
extension MyActor: @unchecked Sendable {} // ❌ опасно
```

---

### ❌ `@preconcurrency` без понимания

```swift
@preconcurrency
protocol MyLegacyAPI { // ❌ не нужно без уверенности
    func doSomething()
}
```

---

### ❌ Актор хранит non-Sendable класс

```swift
actor Engine {
    private let logger = Logger() // ❌ Logger не Sendable
}
```

---

## ✅ Пример корректного DI

```swift
// Абстракция
protocol StorageProtocol: Sendable {
    func save(_ data: Data) async
}

// Реализация
actor MyStorage: StorageProtocol {
    func save(_ data: Data) async {
        print("Saved: \(data)")
    }
}

// Сервис — обычный класс, не actor
final class AppService {
    private let storage: StorageProtocol

    init(storage: StorageProtocol) {
        self.storage = storage
    }

    func run() async {
        await storage.save("Important Data")
    }
}

// Composition Root
let storage = MyStorage()
let service = AppService(storage: storage)
Task {
    await service.run()
}
```

---

## ✅ Хорошая архитектура: ключевые принципы

* Один `actor` — одна зона изоляции. Не вкладывай `actor` в `actor`.
* У каждого сервиса должна быть явная зависимость и открытая точка DI.
* Не полагайся на `.shared` внутри классов. Это ответственность composition root.
* Протоколы делают архитектуру гибкой. Реализации — подменяемыми. А тесты — лёгкими.

