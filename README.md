## Recipe Task (Flutter)

A simple, cleanly-structured Flutter app that lists recipes, shows categories, and displays detailed info for a selected recipe. Built with BLoC (Cubit), Dio, GetIt, and JSON code generation.

### Project structure
<p align="center"><img src="assets/images/logo.jpg" alt="Rabbit Recipes" width="240"></p>

<h1 align="center">Recipe Task (Flutter)</h1>

<p align="center">A clean Flutter app that lists recipes, categories, and details — built with BLoC (Cubit), Dio, GetIt, and JSON codegen.</p>

## 🎥 Video [Watch Demo Video]

https://github.com/user-attachments/assets/475bff55-7014-4cd4-936e-d32157efaea7

<img width="280" height="600" alt="Screenshot_1754815860" src="https://github.com/user-attachments/assets/7afd7538-cb1c-4280-bee1-cdda58ba860f" />
<img width="280" height="600" alt="Screenshot_1754815907" src="https://github.com/user-attachments/assets/a118013e-1630-4e57-a8ba-af66f6ea88a0" />
<img width="280" height="600" alt="Screenshot_1754815913" src="https://github.com/user-attachments/assets/6b998fb4-f3e2-4181-80db-279a4bd60537" />

## Table of Contents

- Setup
- Run and common tasks
- Features
- Architecture
- Project structure
- Configuration
- Tech stack
- Documentation
- Project Requirements

## Setup

If it’s your first time on this machine:

1) Verify Flutter and Dart (Dart >= 3.7)

Note: If your Dart SDK is >= 3.5 you can run the iOS app by editing pubspec.yaml. Android may not run due to breaking changes from the Groovy -> Kotlin (KTS) migration.
```powershell
flutter --version
dart --version
```

2) Check environment and platforms
```powershell
flutter doctor
```

3) Install project dependencies
```powershell
flutter pub get
```

4) Generate JSON code (required before first run)
```powershell
dart run build_runner build --delete-conflicting-outputs
```

5) Run on a device/emulator
```powershell
flutter run
```

## Run and common tasks

- Run the app
```powershell
flutter run
```

- Run tests
```powershell
flutter test
```

- Analyze (lint)
```powershell
flutter analyze
```

## Features

- Recipes grid with skeleton loading states
- Categories chips in a pinned sliver app bar
- Recipe details screen with ingredients and steps
- Robust error handling with retry
- Responsive layout via a lightweight sizing helper

## Architecture (high level)

- Core: routing, DI, networking (Dio), theming, shared widgets/utilities
- Feature modules: data (DTOs, mappers, remote), domain (entities, use cases, repo interfaces), presentation (Cubits, UI)

## Project structure

```
lib/
	core/             # di, routing, networking, theming, shared models/widgets
	recipes/          # feature module
		data/           # DTOs, mappers, remote data sources, repo impl
		domain/         # entities, use cases, repo interface
		presentation/   # cubits, screens, widgets
test/
	recipes/          # repository unit tests
```

## Configuration

API base and endpoints are defined in `lib/core/networking/api_constants.dart`:
- Base: `https://mocki.io/v1/`
- Recipes: `6b2ffb2c-e143-4bf1-94fa-d43da8a33111` (pageNumber, pageSize)
- Categories: `00bc95d2-5706-4b08-91b4-5ca00bdb78c7`
- Recipe details: `3ca54879-2bb8-4d35-b2bb-77c95a15012a` (id)

## Tech stack

- Flutter (Dart >= 3.7)
- State: flutter_bloc (Cubit)
- Networking: Dio (+ PrettyDioLogger in debug)
- DI: GetIt
- JSON: json_serializable + json_annotation
- Tests: flutter_test + mocktail

## Project Requirements

This document captures what the app does today and what it aims to achieve next. It’s written to be precise, testable, and implementation-aware.

### Scope and goals

- Build a Flutter app that lists recipes and shows details for a selected recipe.
- Fetch data from a public HTTP API using Dio.
- Use BLoC/Cubit for state management and GetIt for dependency injection.
- Provide responsive UI and basic error handling with retry.

Out of scope (for now): authentication, persistence/caching, push notifications, analytics, complex filtering/search, offline-first data storage.

### Functional requirements (current)

1. Home screen
   - Display a pinned sliver app bar with title and logo.
   - Show a horizontal list of recipe categories (read-only visual list for now).
   - Show a grid of recipe cards (2 columns) with skeleton placeholders while loading.
   - On error, show an error message and a Retry button to refetch the first page.

2. Recipe details
   - Navigating to a recipe card opens a details screen using a named route and the recipe id.
   - While loading, show a skeleton view; on success, show details (ingredients, steps, meta info).
   - On error, show an error message and a Retry button that retriggers the fetch for the same id.

3. Networking
   - Read-only GET endpoints to fetch: categories list, paginated recipe list, and detailed recipe by id.
   - Handle common HTTP and connectivity errors and present a user-friendly message.

### Non-functional requirements

- Reliability: timeouts for network requests (90s), graceful error handling, connectivity check before calls.
- Performance: lazy rendering via slivers, lightweight DTO-to-entity mapping, cached network images.
- Responsiveness: adapt sizes via `AppSizer` to various screen dimensions.
- Code quality: layered architecture (data/domain/presentation), JSON code generation, static analysis with flutter_lints.

### Acceptance criteria (high-level)

- When online and the API responds with success, the home screen shows at least one recipe card and category chip list.
- Tapping a recipe navigates to a details screen that loads and displays recipe details.
- When a network or server error occurs, the user sees a clear message and can tap Retry to try again.
- App adapts visually on different screen sizes using `AppSizer`.
