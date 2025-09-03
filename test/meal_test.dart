// test/models/meal_model_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_tracker/services/models/meal.dart';

void main() {
  test('Meal toMap/fromMap round-trip', () {
    final m = Meal(
      title: 'Dinner',
      description: 'Rice & beans',
      calories: 450,
      protein: 18,
      carbs: 70,
      fat: 8,
      date: '2025-09-03',
    );

    final map = m.toMap();
    expect(map['title'], 'Dinner');
    expect(map['calories'], 450);

    final m2 = Meal.fromMap(map);
    expect(m2.title, 'Dinner');
    expect(m2.description, 'Rice & beans');
    expect(m2.calories, 450);
    expect(m2.protein, 18);
    expect(m2.carbs, 70);
    expect(m2.fat, 8);
    expect(m2.date, '2025-09-03');
  });
}
