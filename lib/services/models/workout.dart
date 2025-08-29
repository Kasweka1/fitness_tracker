class Workout {
  final int? id;
  final String name;
  final int duration; // seconds
  final double caloriesBurned;
  final String date;

  Workout({
    this.id,
    required this.name,
    required this.duration,
    required this.caloriesBurned,
    required this.date,
    required double calories,
    required String type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'duration': duration,
      'calories_burned': caloriesBurned,
      'date': date,
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'],
      name: map['name'],
      duration: map['duration'],
      caloriesBurned: map['calories_burned'],
      date: map['date'],
      calories: map['calories'],
      type: '',
    );
  }
}
