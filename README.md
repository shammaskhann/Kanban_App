# 📋 Kanban App - Task & Time Management

A modern, feature-rich Flutter application for managing tasks with real-time kanban boards, time tracking, comments, and theme customization.

[![Flutter](https://img.shields.io/badge/Flutter-3.35.2-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9.0-blue.svg)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## 🎯 Features

### ✅ Core Features
- **📊 Kanban Board**: Drag-and-drop task management with To-Do, In Progress, and Done columns
- **⏱️ Time Tracking**: Track time spent on tasks with duration management
- **💬 Comments**: Add and view comments on tasks for collaboration
- **🎨 Theme Support**: Dark/Light theme toggle with persistent storage
- **🔄 Real-time Sync**: Automatic data refresh and synchronization
- **📱 Responsive Design**: Works seamlessly on all screen sizes

### 🏗️ Architecture
- **Clean Architecture**: Separation of concerns with Domain, Data, and Presentation layers
- **BLoC Pattern**: State management using flutter_bloc with Cubit
- **Dependency Injection**: GetIt service locator for loose coupling
- **Type Safety**: Freezed for immutable models with JSON serialization

### 🧪 Quality & Delivery
- **80+ Automated Tests**: Coverage across domain, data, and presentation layers
- **GitHub Actions**: Automated testing, analysis, and APK building
- **Code Quality**: flutter analyze and format checks on every push
- **Coverage Reports**: Integration with Codecov for tracking test coverage

---

## 🧭 Engineering Principles

- **DRY / KISS / SOLID**: Lean, composable classes with clear boundaries
- **MVP First**: Ship fast, iterate with user feedback
- **User-Centered Design**: Flows and visuals built around real user goals
- **Performance**: Fast startup, smooth scroll, minimal memory/battery footprint
- **Readable & Maintainable**: Consistent naming, small widgets, clear layering
- **TDD Mindset**: Write expectations first, then implement
- **CI/CD**: Every push is tested, analyzed, built, and packaged automatically

---

## 🎨 Screenshots

### Home Screen
<img src="assets/screenshot/home_view.png" width="250" alt="Home View">
<img src="assets/screenshot/home_view2.png" width="250" alt="Home View 2">

### Task Board
<img src="assets/screenshot/taskboard_view.png" width="250" alt="Task Board View">
<img src="assets/screenshot/taskboard_view2.png" width="250" alt="Task Board View 2">
<img src="assets/screenshot/taskboard_view3.png" width="250" alt="Task Board View 3">

### Task Management
<img src="assets/screenshot/add_task.png" width="250" alt="Add Task">
<img src="assets/screenshot/update_task.png" width="250" alt="Update Task">
<img src="assets/screenshot/delete_task.png" width="250" alt="Delete Task">

### Comments
<img src="assets/screenshot/comment_Task.png" width="250" alt="Comments">

### Time Tracking
<img src="assets/screenshot/time_track_view.png" width="250" alt="Time Track View">
<img src="assets/screenshot/time_track_view2.png" width="250" alt="Time Track View 2">
<img src="assets/screenshot/time_track_taskselection.png" width="250" alt="Task Selection">

---

## 🚀 Getting Started

### Prerequisites
- Flutter 3.35.2+
- Dart 3.9.0+
- Android SDK 21+
- iOS 11.0+ (optional)

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/shammaskhann/Kanban_App.git
cd kanban_app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Generate code**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Run the app**
```bash
flutter run
```

---

## 📦 Project Structure

```
lib/
├── core/                          # Core utilities
│   ├── constants/                 # App constants
│   ├── enums/                     # TaskStatus enum
│   ├── errors/                    # Error handling
│   ├── theme/                     # Theme configuration
│   └── utils/                     # Utility functions
├── data/                          # Data layer
│   ├── data_sources/              # API & Local data sources
│   │   ├── remote/                # API calls (Todoist)
│   │   └── local/                 # Hive local storage
│   ├── model/                     # JSON models with Freezed
│   └── repositories/              # Repository implementations
├── domain/                        # Domain layer
│   ├── entities/                  # Business models
│   ├── irepositories/             # Repository interfaces
│   └── usecases/                  # Business logic usecases
├── di/                            # Dependency injection
├── network/                       # HTTP client setup
├── presentation/                  # UI layer
│   ├── common/                    # Shared components
│   ├── screen/                    # App screens
│   │   ├── home/                  # Home screen
│   │   ├── task_board/            # Kanban board
│   │   ├── timer/                 # Time tracking
│   │   ├── dashboard/             # Navigation container
│   │   └── splash/                # Splash screen
│   └── cubit/                     # State management
├── services/                      # Services (Hive, etc)
└── main.dart                      # App entry point

test/
├── domain/                        # Domain layer tests
├── data/                          # Data layer tests
└── presentation/                  # UI/State tests
```

---

## 🛠️ Tech Stack

### State Management
- **flutter_bloc** (8.1.2) - Reactive state management
- **bloc** (8.1.4) - Core BLoC library

### Data & Serialization
- **freezed_annotation** - Immutable models
- **json_serializable** - JSON serialization
- **hive** - Local storage
- **dio** - HTTP client

### Architecture & DI
- **get_it** - Service locator
- **mockito** - Mocking for tests

### UI & Theme
- **flutter_lints** - Code quality
- **google_fonts** - Custom typography

### API Integration
- **Todoist REST v2 API** - Task management backend

---

## 🧪 Automated Tests

### Run All Tests
```bash
flutter test
```

### Run Specific Test File
```bash
flutter test test/domain/usecases/usecases_test.dart
```

### Run with Coverage
```bash
flutter test --coverage
```

### Test Results
- ✅ **80+ tests passing**
- ✅ Domain layer coverage
- ✅ Data layer coverage
- ✅ Presentation/State management coverage
- ✅ Integration coverage

---

## 🔄 CI/CD Pipeline

### GitHub Actions Workflow
Automated testing and building on every push:

**Jobs:**
1. **Test** - Runs 80+ automated tests with coverage
2. **Analyze** - Code quality checks and formatting
3. **Build** - Creates release APK
4. **Notify** - Summary of pipeline status

**Triggers:**
- Push to `main` or `develop` branch
- Pull requests to `main` or `develop`

### View CI/CD Status
```
https://github.com/shammaskhann/Kanban_App/actions
```

### Download APK
1. Go to **Actions** tab on GitHub
2. Click latest successful workflow run (✅)
3. Scroll to **Artifacts** section
4. Download `kanban-app-release.apk`

---

## 📱 Installation on Device

### Android
```bash
# Via ADB
adb install build/app/outputs/flutter-apk/app-release.apk

# Or transfer APK manually
# 1. Copy APK to phone via USB
# 2. Open Files > Select APK > Install
```

### iOS
```bash
flutter run --release
```

---

## 🔐 API Configuration

The app uses **Todoist REST v2 API**. To connect your own Todoist account:

1. Get API token from [Todoist Settings](https://todoist.com/app/settings/integrations/developer)
2. Update in your app's API configuration:

```dart
// lib/network/constants/api_endpoints.dart
static const String apiToken = 'YOUR_TODOIST_TOKEN';
```

---

## 🎮 Usage Guide

### Home Screen
- View task summary and statistics
- Quick overview of pending tasks
- Navigate to detailed views

### Task Board (Kanban)
- Drag tasks between To-Do, In Progress, Done columns
- Tap task to view details
- Long-press to delete
- Swipe to update

### Add Task
1. Click **"+"** button
2. Enter task title
3. (Optional) Set due date
4. Select status
5. Tap **Save**

### Comments
1. Open task details
2. Click **Comments** button
3. View existing comments
4. Type and send new comment
5. Comments auto-refresh

### Time Tracking
1. Go to **Timer** tab
2. Select task to track
3. Click **Start** timer
4. Set duration when done
5. Auto-saves to task

### Theme Toggle
- Click theme icon (sun/moon) in top-right
- Switches between Light/Dark mode
- Preference saved automatically

---

## 🐛 Known Issues & Limitations

- Requires internet connection for API sync
- Todoist API rate limits apply (100 requests/min)
- Local cache updates after API success
- Comments require task to be saved first

---

## 🔄 Updates & Maintenance

### Pre-Push Checklist
```bash
# Run before pushing code
bash check-before-push.sh
```

This checks:
- ✅ Dependencies
- ✅ Code generation
- ✅ Code quality
- ✅ Formatting
- ✅ All tests pass

### Keep Dependencies Updated
```bash
flutter pub upgrade
```

---

## 📋 API Endpoints

| Method | Endpoint | Purpose |
|--------|----------|---------|
| GET | `/rest/v2/tasks` | Fetch all tasks |
| POST | `/rest/v2/tasks` | Create task |
| POST | `/rest/v2/tasks/{id}/close` | Mark as done |
| POST | `/rest/v2/tasks/{id}/reopen` | Reopen task |
| DELETE | `/rest/v2/tasks/{id}` | Delete task |
| GET | `/rest/v2/tasks/{id}/comments` | Get comments |
| POST | `/rest/v2/comments` | Add comment |

---

## 🤝 Contributing

1. Create feature branch: `git checkout -b feature/your-feature`
2. Commit changes: `git commit -m "Add feature"`
3. Push to branch: `git push origin feature/your-feature`
4. Create Pull Request
5. Wait for CI/CD checks to pass

### Code Standards
- Follow Dart style guide
- Write tests for new features
- Ensure all tests pass locally
- Run `flutter analyze` and `flutter format`

---

## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

---

## 📧 Support & Contact

For issues, suggestions, or questions:
- 📌 Open an issue on GitHub
- 💬 Create a discussion
- 📧 Contact via [shammaskhann@example.com]

---

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev) - UI framework
- [Todoist API](https://developer.todoist.com) - Task management API
- [BLoC Pattern](https://bloclibrary.dev) - State management architecture
- [Clean Architecture](https://resocoder.com/flutter-clean-architecture) - Project structure

---

## 📊 Project Stats

- **Lines of Code**: 5,000+
- **Automated Tests**: 80+
- **Screens**: 6 main screens
- **API Endpoints**: 7
- **Dependencies**: 25+
- **Build Time**: ~3 minutes

---

**Last Updated**: January 12, 2026  
**Version**: 1.0.0  
**Status**: ✅ Production Ready

---

<div align="center">

Made with ❤️ by Shammas Khan

⭐ If you found this helpful, please star the repo!

</div>
