// test/models/workout_model_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_tracker/services/models/workout.dart';

void main() {
  test('Workout toMap/fromMap round-trip', () {
    final w = Workout(
      name: 'Cycling',
      type: 'Cardio',
      duration: 25,
      caloriesBurned: 200,
      date: '2025-09-03',
    );

    final map = w.toMap();
    expect(map['name'], 'Cycling');
    expect(map['duration'], 25);

    final w2 = Workout.fromMap(map);
    expect(w2.name, 'Cycling');
    expect(w2.type, 'Cardio');
    expect(w2.duration, 25);
    expect(w2.caloriesBurned, 200);
    expect(w2.date, '2025-09-03');
  });
}
