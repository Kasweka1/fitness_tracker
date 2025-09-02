# Fitness Tracker — Overview

Fitness Tracker is a Flutter application that helps users monitor daily wellness metrics such as workouts, meals, hydration, and sleep. It provides a clean UI, lightweight local persistence, and a modular codebase for easy extension.

## Key Features
- Onboarding splash and authentication screens (login/register)
- Track workouts, meals, water intake, and sleep
- Theming with custom text styles and color schemes
- Responsive UI for phones and tablets

## Tech Stack
- Flutter (Material 3 widgets)
- Dart
- Local data layer (see services/db and services/models)

## App Entry
- lib/main.dart sets up MaterialApp, routing, and theming
- Initial screen: SplashScreen
- Named routes: `/login`, `/register`

## Status and Roadmap
- Current status: MVP under active development
- Planned:
  - Cloud sync and auth provider integration
  - Analytics and insights
  - Notifications and reminders

