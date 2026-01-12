# 📋 Kanban App — Production Guide

Modern Flutter app for task management with kanban boards, comments, time tracking, and theming. Built for reliability, performance, and rapid release.

[![Flutter](https://img.shields.io/badge/Flutter-3.35.2-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9.0-blue.svg)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## 🎯 What You Get
- **Kanban board** with To-Do / In Progress / Done columns
- **Time tracking** with duration updates
- **Comments** per task
- **Theme toggle** (light/dark) with persistence
- **Fast & responsive** UI with offline-friendly caching

## 🧭 How We Build (Principles)
- **DRY / KISS / SOLID**: Small, focused classes and widgets
- **MVP first**: Shipable slices, iterate from user feedback
- **User-centered**: Clear flows, accessible UI
- **Performance**: Fast startup, smooth scroll, lean memory/battery
- **Readable & maintainable**: Predictable naming, layered architecture
- **TDD mindset**: Expectations before implementation
- **CI/CD by default**: Every push tested, analyzed, built

## 🖼️ Product Preview

### Home
<img src="assets/screenshot/home_view.png" width="240" alt="Home View"> <img src="assets/screenshot/home_view2.png" width="240" alt="Home View 2">

### Task Board
<img src="assets/screenshot/taskboard_view.png" width="240" alt="Task Board"> <img src="assets/screenshot/taskboard_view2.png" width="240" alt="Task Board 2"> <img src="assets/screenshot/taskboard_view3.png" width="240" alt="Task Board 3">

### Task Actions
<img src="assets/screenshot/add_task.png" width="240" alt="Add Task"> <img src="assets/screenshot/update_task.png" width="240" alt="Update Task"> <img src="assets/screenshot/delete_task.png" width="240" alt="Delete Task">

### Comments
<img src="assets/screenshot/comment_Task.png" width="240" alt="Comments">

### Time Tracking
<img src="assets/screenshot/time_track_view.png" width="240" alt="Time Track"> <img src="assets/screenshot/time_track_view2.png" width="240" alt="Time Track 2"> <img src="assets/screenshot/time_track_taskselection.png" width="240" alt="Task Selection">

---

## 🏗️ Architecture
- **Clean Architecture**: Domain / Data / Presentation separation
- **State**: BLoC/Cubit (flutter_bloc), immutable states
- **DI**: GetIt service locator
- **Models**: Freezed + JSON serialization
- **Network**: Dio client to Todoist REST v2
- **Storage**: Hive for local persistence

### Folder Map
```
lib/
├─ core/          # constants, enums, errors, theme, utils
├─ data/          # data_sources (remote/local), models, repositories
├─ domain/        # entities, repository interfaces, usecases
├─ di/            # dependency injection setup
├─ network/       # client and endpoints
├─ presentation/  # screens, widgets, cubits, common components
├─ services/      # platform services (e.g., Hive)
└─ main.dart

test/
├─ domain/
├─ data/
└─ presentation/
```

---

## 🛠️ Tech Stack
- **Flutter 3.35.2 / Dart 3.9.0**
- **flutter_bloc**, **freezed**, **json_serializable**, **dio**, **hive**, **get_it**
- **mockito**, **flutter_test** for automated checks

---

## ✅ Quality & Delivery
- **80+ automated tests** across domain/data/presentation
- **GitHub Actions**: test → analyze → build → notify
- **Coverage tracking** via lcov + Codecov
- **Formatting & linting** enforced in CI

Run locally:
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter test --coverage
```

---

## 🚀 Release & Install

### Get the APK
1) Go to GitHub → Actions → latest successful run (✅)  
2) Scroll to **Artifacts** → download `kanban-app-release.apk`

Local path after build:
```

```

### Install on Android
```bash
adb install build/app/outputs/flutter-apk/app-release.apk
```

### Run on iOS (dev)
```bash
flutter run --release
```

---

## 🔐 API Setup (Todoist REST v2)
1) Get your token: Todoist Settings → Integrations → Developer  
2) Set it in `lib/network/constants/api_endpoints.dart`:
```dart
static const String apiToken = 'YOUR_TODOIST_TOKEN';
```

---

## 🧪 Automated Tests
- All tests: `flutter test`
- Focused file: `flutter test test/domain/usecases/usecases_test.dart`
- Coverage: `flutter test --coverage`

---

## 🔄 CI/CD Pipeline (GitHub Actions)
- **Test**: 80+ automated checks with coverage
- **Analyze**: Static analysis and formatting gate
- **Build**: Release APK artifact
- **Notify**: Final status summary

Triggers: push/PR to `main` or `develop`. Artifacts retained for download.

---

## 🧩 Usage Highlights
- Drag tasks across columns; long-press to delete, tap to edit
- Add/update tasks with optional due dates and status
- Comment per task with auto-refresh
- Track time per task from Timer tab; save duration back
- Toggle light/dark themes; preference persisted

---

## 🐛 Known Constraints
- Network required for API sync; Todoist rate limits apply
- Comments need a saved task id
- Local cache updates after successful API calls

---

## 📊 Ops Snapshot
- **Automated Tests**: 80+
- **Screens**: 6 core screens
- **API Endpoints**: 7
- **Build Time**: ~3 minutes

---

## 📧 Support
- Issues / discussions on GitHub
- Contact: shammaskhann@example.com

---

## 🙏 Credits
- Flutter, Todoist API, BLoC, Clean Architecture community resources

---

**Status**: Production-ready  
**Last Updated**: January 12, 2026  
**Version**: 1.0.0
```
