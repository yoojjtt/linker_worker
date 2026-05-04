# Worker - Flutter Project

## Project Overview
- **Name**: worker
- **Type**: Flutter mobile/web application
- **SDK**: Dart ^3.9.2
- **Version**: 1.0.0+1

## Tech Stack
- Flutter (Material Design)
- Dart
- Platforms: Android, iOS, Web, macOS, Linux, Windows

## Project Structure
```
lib/           → Dart source code (entry: main.dart)
android/       → Android platform code
ios/           → iOS platform code
web/           → Web platform code
macos/         → macOS platform code
linux/         → Linux platform code
windows/       → Windows platform code
test/          → Test files
```

## Commands
```bash
flutter run              # Run the app
flutter build apk        # Build Android APK
flutter build ios        # Build iOS
flutter build web        # Build for web
flutter test             # Run tests
flutter analyze          # Run static analysis
flutter pub get          # Install dependencies
```

## Conventions
- Follow Dart/Flutter official style guide
- Use `const` constructors where possible
- Use `flutter_lints` for static analysis (analysis_options.yaml)
