# Ghibli Viewer

A simple Flutter application demonstrating **Layered Architecture** using the **MVVM (Model-View-ViewModel)** pattern and **Provider** for dependency injection and state management.

##  Architecture Overview

This project is structured to separate concerns, making the codebase maintainable and testable. It follows a strict three-layer approach:

### 1. Model Layer (Data & Service)
- **Models:** Define the data structure (e.g., `Film`).
- **Services:** Handle external communication (e.g., `GhibliApiService` fetches data from the REST API). This layer knows nothing about the UI.

### 2. ViewModel Layer (Business Logic)
- **ViewModels:** Act as the bridge between the Model and the View. They hold the UI state (loading, error, data) and expose methods to interact with the Service (e.g., `fetchFilms()`).
- **State Management:** Extends `ChangeNotifier` to notify the View when data changes.

### 3. View Layer (UI)
- **Widgets:** Pure UI components (e.g., `FilmsView`, `FilmCard`) that render data provided by the ViewModel.
- **Reactivity:** Uses `Consumer` or `context.watch` to automatically rebuild when the ViewModel state updates.

> 💡 **Dependency Injection:** The `Provider` package is used at the root of the app (`MainApp`) to instantiate the Service and ViewModel once and inject them into the entire widget tree. This decouples the creation of objects from their usage.



##  Getting Started

Ensure you have the [Flutter SDK](https://flutter.dev) installed and configured on your machine.

### 1. Clone and Install
```bash
git clone <repository_url>
cd ghibli_viewer
flutter pub get
```
### 2. Run the App
Choose a target device (Chrome for web, Android/iOS emulator, or physical device):

Run on Chrome (Web)
```
flutter run -d chrome
```

