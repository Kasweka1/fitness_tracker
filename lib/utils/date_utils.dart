// lib/utils/date_utils.dart
String todayDate() {
  return DateTime.now().toIso8601String().split('T').first;
}
