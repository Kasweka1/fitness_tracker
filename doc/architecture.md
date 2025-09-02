# Architecture

This document outlines the high-level architecture of the Fitness Tracker app.

## Layers
- Presentation (UI): Widgets in `lib/screens/**` organized by feature (auth, splash, home tabs, widgets)
- Theming: `lib/core/theme` centralizes color schemes and text styles
- Services: `lib/services/**` for data access, models, and database helpers
- Utilities: `lib/utils` for shared helpers and constants
- Assets: Fonts and images under `assets/**`

## State and Navigation
- Navigation: `MaterialApp` with `home: SplashScreen()` and named routes `/login`, `/register`
- State: Local widget state and simple service calls (no external state library found). This can evolve to Provider/Riverpod/Bloc as needed.

## Data
- Models under `lib/services/models`
- Persistence helpers under `lib/services/db`

## Theming
- `core/theme/theme.dart` and `core/theme/util.dart` provide Material 3 themes and text styles

## Error Handling
- UI-level try/catch around service calls (to be expanded)
- Input validation on auth screens (to be expanded)

## Testing
- Unit/widget tests under `test/` (add more as features grow)
