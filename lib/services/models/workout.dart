class Workout {
  final int? id;
  final String name;
  final String type;
  final int duration; // seconds
  final double caloriesBurned;
  final String date;

  Workout({
    this.id,
    required this.name,
    required this.type,
    required this.duration,
    required this.caloriesBurned,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'duration': duration,
      'calories_burned': caloriesBurned,
      'date': date,
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      duration: map['duration'],
      caloriesBurned: map['calories_burned'],
      date: map['date'],
    );
  }
}
