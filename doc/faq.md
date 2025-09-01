# FAQ

## Which Flutter version is required?
Flutter 3.6.0 or newer is recommended. Run `flutter --version` to verify.

## How do I run the app?
- Install dependencies with `flutter pub get`
- Start an emulator or connect a device
- Run `flutter run`

## Where do I change themes and fonts?
- See `lib/core/theme/theme.dart` and `lib/core/theme/util.dart`

## How is navigation set up?
- `MaterialApp` with `home: SplashScreen()` and named routes `/login` and `/register` in `lib/main.dart`

## Where are models and DB helpers?
- Models in `lib/services/models`
- DB helpers in `lib/services/db`

## How do I contribute?
- See `doc/contributing.md`
