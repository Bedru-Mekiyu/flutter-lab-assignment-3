# Album App

A cross-platform Flutter application for browsing photo albums and viewing high-resolution image galleries, built using state-of-the-art Flutter architecture and best engineering practices.

---

## 📖 Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Technology Stack](#technology-stack)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the App](#running-the-app)
- [Testing](#testing)
- [CI/CD Pipeline](#cicd-pipeline)

---

## Overview

The **Album App** is a responsive Flutter mobile and web application that integrates with RESTful APIs (via [JSONPlaceholder](https://jsonplaceholder.typicode.com/)) to present structured album collections. It demonstrates clean architecture principles, state management with `flutter_bloc`, declarative routing with `go_router`, and robust caching using `cached_network_image`.

---

## Key Features

- 🖼️ **Album Catalog**: Fetches and displays album titles alongside dynamic photo thumbnails.
- 🔍 **Album Details View**: Detailed photo grid gallery per album.
- ⚡ **Optimized Caching**: Fast image loading and disk/memory caching with graceful error fallbacks.
- 🧭 **Declarative Navigation**: Seamless URL-driven deep linking using `go_router`.
- 🛡️ **State Management**: Predictable state flows powered by `flutter_bloc`.

---

## Technology Stack

- **Language**: Dart (>= 2.19.0 < 3.0.0 support)
- **Framework**: Flutter
- **State Management**: `flutter_bloc`
- **Routing**: `go_router`
- **HTTP Client**: `http`
- **Image Caching**: `cached_network_image`
- **CI/CD**: GitHub Actions

---

## Architecture

The project follows a modular, layered architecture separating UI, Business Logic, Data Storage, and Network layers:

```
┌─────────────────────────────────────────┐
│               UI Layer                  │
│   (AlbumListScreen, AlbumDetailScreen)   │
└────────────────────┬────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────┐
│            Business Logic               │
│          (AlbumBloc, State)             │
└────────────────────┬────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────┐
│            Repository Layer             │
│            (AlbumRepository)            │
└────────────────────┬────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────┐
│            Data / Network               │
│     (http.Client / JSONPlaceholder)     │
└─────────────────────────────────────────┘
```

---

## Project Structure

```
.
├── .github/
│   └── workflows/
│       └── ci.yml               # Automated CI pipeline
├── album_app/
│   ├── lib/
│   │   ├── bloc/                # BLoC state management logic
│   │   ├── models/              # Data models (Album, Photo)
│   │   ├── repository/          # Data fetching & repository logic
│   │   ├── screens/             # UI Screens
│   │   ├── viewmodel/           # Screen view models
│   │   └── main.dart            # Application entry point & router setup
│   ├── test/                    # Unit & widget tests
│   ├── pubspec.yaml             # Dependencies & metadata
│   └── analysis_options.yaml    # Linter rules
└── README.md                    # Portfolio documentation
```

---

## Getting Started

### Prerequisites

Ensure you have installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x recommended)
- [Dart SDK](https://dart.dev/get-dart)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/flutter-lab-assignment-3.git
   cd flutter-lab-assignment-3/album_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

Run the application on an available emulator or device:

```bash
flutter run
```

---

## Testing

Run the widget and unit test suites:

```bash
cd album_app
flutter test
```

Run static code analysis:

```bash
flutter analyze
```

---

## CI/CD Pipeline

Automated quality control is configured with **GitHub Actions** (`.github/workflows/ci.yml`). On every push and pull request to `main`, the workflow executes:

1. **Environment Setup**: Provisions Flutter stable SDK with package caching.
2. **Dependency Resolution**: Runs `flutter pub get`.
3. **Static Analysis**: Runs `flutter analyze` to ensure zero linter warnings or errors.
4. **Automated Testing**: Runs `flutter test` to verify unit and widget regressions.
