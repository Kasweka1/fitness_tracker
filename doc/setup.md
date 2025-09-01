# Setup and Running

## Prerequisites
- Flutter SDK 3.6.0+
- Dart SDK
- An IDE (VS Code or Android Studio)
- Emulator or device connected

## Installation
1. Clone repository
```
git clone https://github.com/Kasweka1/fitness_tracker.git
cd fitness_tracker
```
2. Install dependencies
```
flutter pub get
```
3. Run the app
```
flutter run
```

## Build
- Android (debug): `flutter build apk --debug`
- Android (release): `flutter build apk --release`
- iOS (release): `flutter build ios --release`
- Web: `flutter build web`

## Troubleshooting
- If you see missing SDK errors, run `flutter doctor` and follow suggestions
- If assets are not loading, ensure `pubspec.yaml` has the assets section and run `flutter pub get`
- If builds fail after upgrading Flutter, run `flutter clean` then `flutter pub get`
