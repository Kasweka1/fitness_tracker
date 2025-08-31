class Meal {
  final int? id;
  final String title;
  final String description;
  final double calories;
  final double carbs;
  final double protein;
  final double fat;
  final String date;

  Meal({
    this.id,
    required this.title,
    required this.description,
    required this.calories,
    required this.carbs,
    required this.protein,
    required this.fat,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'calories': calories,
      'carbs': carbs,
      'protein': protein,
      'fat': fat,
      'date': date,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      calories: map['calories'],
      carbs: map['carbs'],
      protein: map['protein'],
      fat: map['fat'],
      date: map['date'],
    );
  }
}
