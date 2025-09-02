# Contributing Guide

Thank you for considering contributing to Fitness Tracker! This guide will help you get started.

## Getting Started
1. Fork the repository
2. Create a feature branch from `main`: `git checkout -b feat/your-feature`
3. Install dependencies: `flutter pub get`
4. Run the app and tests locally

## Coding Standards
- Follow Dart/Flutter best practices
- Keep widgets small and composable
- Prefer meaningful names and clear comments where needed
- Run static analysis: `flutter analyze`
- Run formatter: `dart format .` (or enable IDE format on save)

## Commits & PRs
- Conventional Commits recommended:
  - feat: add new feature
  - fix: bug fix
  - docs: documentation updates
  - refactor: code restructuring without behavior change
  - test: adding or updating tests
  - chore: tooling/maintenance
- Open a PR with a clear description, screenshots if UI-related, and link to issues

## Tests
- Place unit/widget tests under `test/`
- Ensure all tests pass before submitting a PR: `flutter test`

## Reporting Issues
- Use the issue tracker with steps to reproduce, expected vs actual, and environment details
