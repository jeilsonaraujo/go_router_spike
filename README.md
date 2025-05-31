# go_router_spike

This project is a proof of concept (spike) that demonstrates **how to detect navigation returns ("back") in a Flutter application using exclusively `go_router`**, without resorting to `push/pop`, `Navigator.pop`, or any imperative navigation logic.

---

## 🎯 Objective

In many applications, especially with **lists and detail screens**, it's necessary to know when the user **returned to the previous screen** (e.g., left the detail and returned to the list) — to, for example, **reload data, update state, or display feedback**.

Since `go_router` works in a **declarative** way and doesn't directly offer a "pop" event, this spike implements a solution based on:

- `go_router` for navigation (using only `go()` and `goNamed()`)
- `RouteObserver` + `RouteAware` to detect when a screen **returns to the top of the stack**

---

## 🧭 Demonstrated Functionality

- Navigation with nested routes (`FeatureB`, `FeatureC`) and parallel routes (`FeatureD`)
- Navigation exclusively with `goNamed(...)`
- Automatic observation of when the screen is redisplayed (return from detail to list)
- Ideal for scenarios such as:
  - `Item List` → `Item Detail` → back to list and reload

---

## 📦 Dependencies

- [`go_router`](https://pub.dev/packages/go_router) – Declarative routes manager
- Flutter `RouteObserver` – For reverse navigation detection (back)

---

## 🗺️ Route Structure

```txt
FeatureA (simulates a list of items)
├── FeatureB (nested detail)
│   └── FeatureC (deeper detail)
FeatureD (parallel route, can also return to A)
```

- All screens use `context.goNamed(...)` for navigation
- `FeatureA` implements `RouteAware` to detect if it has been redisplayed

---

## ✅ Simulated Use Cases

### ✔️ Example 1: Return from a nested detail

```dart
context.goNamed('feature-b'); // go to detail
```

Then, when returning to `FeatureA`, the method below is called:

```dart
@override
void didPopNext() {
  // Detects return from detail to list
  fetchUpdatedItems(); // example
}
```

### ✔️ Example 2: Go to a parallel route and return

```dart
context.goNamed('feature-d'); // parallel route
context.goNamed('feature-a'); // manual return to A
```

Even with direct navigation (without pop), `FeatureA` detects that it has been redisplayed.

---

## 💡 Technical Motivation

Without this approach, `go_router` by itself **doesn't offer a natural mechanism to know when the user "returned"** to a previous screen. Using `push`/`pop` would solve the problem, but **would break the declarative flow and could generate side effects with `ShellRoute` or global navigation**.

This implementation solves this gap in a way that is:

- Elegant
- Composable
- Compatible with declarative navigation

---

## 📁 Project Structure

```
lib/
├── feature_a/
│   └── feature_a.dart (RouteAware implemented)
├── feature_b/
│   └── feature_b.dart
├── feature_c/
│   └── feature_c.dart
├── feature_d/
│   └── feature_d.dart
└── main.dart
```

---

## ▶️ Execution

```bash
flutter pub get
flutter run
```

---

## 🧪 Next Steps

- Add tests with `WidgetTester` simulating navigation
- Generalize the use of `RouteAware` with mixins or wrappers
- Expand with `ShellRoute` or `State Restoration` if necessary
