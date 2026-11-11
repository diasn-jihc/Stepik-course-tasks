# Flutter Riverpod — course 18.13

## Setup

Run these commands in the project root:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

Riverpod code generation creates `lib/main.g.dart` and `lib/user.g.dart`.
Do not create or edit these generated files manually; rerun the build_runner
command after changing an `@riverpod` declaration.
