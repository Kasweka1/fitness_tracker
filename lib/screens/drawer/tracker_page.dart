import 'package:flutter/material.dart';
import 'package:fitness_tracker/services/models/meal.dart';
import 'package:fitness_tracker/services/models/workout.dart';
import 'package:fitness_tracker/services/db/db_helper.dart';
import 'package:intl/intl.dart';


class TrackerPage extends StatefulWidget {
  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  String _selectedDate = DateTime.now().toIso8601String().split('T').first;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(_selectedDate);
    final formattedDate = DateFormat('EEEE, MMMM d, y').format(date);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Tracker'),
        backgroundColor: Colors.blue[700],
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.white),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with selected date
            Text(
              formattedDate,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 16),
            
            // Summary cards
            Row(
              children: [
                Expanded(child: _buildNutritionSummaryCard()),
                SizedBox(width: 12),
                Expanded(child: _buildWorkoutSummaryCard()),
              ],
            ),
            const SizedBox(height: 20),
            
            // Meals section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Meals',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add meal functionality would go here
                  },
                  child: Text('ADD MEAL'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              flex: 2,
              child: _buildMealsSection(),
            ),
            
            const SizedBox(height: 20),
            
            // Workouts section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Workouts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add workout functionality would go here
                  },
                  child: Text('ADD WORKOUT'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              flex: 1,
              child: _buildWorkoutsSection(),
            ),
          ],
        ),
      ),
    );
  }

  // Nutrition summary card
  Widget _buildNutritionSummaryCard() {
    return FutureBuilder<List<Meal>>(
      future: dbHelper.fetchMealsByDate(_selectedDate),
      builder: (context, snapshot) {
        double totalCalories = 0;
        double totalProtein = 0;
        
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          for (var meal in snapshot.data!) {
            totalCalories += meal.calories;
            totalProtein += meal.protein;
          }
        }
        
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nutrition',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildNutritionCircle('Calories', totalCalories, 'kcal', Colors.blue),
                    SizedBox(width: 16),
                    _buildNutritionCircle('Protein', totalProtein, 'g', Colors.green),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Workout summary card
  Widget _buildWorkoutSummaryCard() {
    return FutureBuilder<List<Workout>>(
      future: dbHelper.fetchWorkoutsByDate(_selectedDate),
      builder: (context, snapshot) {
        int totalWorkouts = 0;
        double totalCaloriesBurned = 0;
        
        if (snapshot.hasData) {
          totalWorkouts = snapshot.data!.length;
          for (var workout in snapshot.data!) {
            totalCaloriesBurned += workout.caloriesBurned;
          }
        }
        
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Workouts',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$totalWorkouts',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                    Text(
                      'Workouts',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      totalCaloriesBurned.toStringAsFixed(0),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                    Text(
                      'Calories Burned',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNutritionCircle(String label, double value, String unit, Color color) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
          child: Center(
            child: Text(
              value.toStringAsFixed(0),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(_selectedDate),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate.toIso8601String().split('T').first != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate.toIso8601String().split('T').first;
      });
    }
  }

  Widget _buildMealsSection() {
    return FutureBuilder<List<Meal>>(
      future: dbHelper.fetchMealsByDate(_selectedDate),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.restaurant, size: 48, color: Colors.grey[400]),
                SizedBox(height: 8),
                Text(
                  'No meals tracked for this date.',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return _buildMealCard(snapshot.data![index]);
            },
          );
        }
      },
    );
  }

  Widget _buildWorkoutsSection() {
    return FutureBuilder<List<Workout>>(
      future: dbHelper.fetchWorkoutsByDate(_selectedDate),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.fitness_center, size: 48, color: Colors.grey[400]),
                SizedBox(height: 8),
                Text(
                  'No workouts tracked for this date.',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return _buildWorkoutCard(snapshot.data![index]);
            },
          );
        }
      },
    );
  }

  Widget _buildMealCard(Meal meal) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue[50],
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.restaurant, color: Colors.blue[700]),
        ),
        title: Text(
          meal.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              '${meal.calories.toStringAsFixed(0)} kcal',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                _buildNutritionPill('Protein', '${meal.protein.toStringAsFixed(0)}g', Colors.green),
                SizedBox(width: 6),
                _buildNutritionPill('Carbs', '${meal.carbs.toStringAsFixed(0)}g', Colors.orange),
                SizedBox(width: 6),
                _buildNutritionPill('Fat', '${meal.fat.toStringAsFixed(0)}g', Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutCard(Workout workout) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.orange[50],
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.fitness_center, color: Colors.orange[700]),
        ),
        title: Text(
          workout.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Row(
              children: [
                _buildWorkoutChip('${workout.duration} min', Icons.timer),
                SizedBox(width: 8),
                _buildWorkoutChip('${workout.caloriesBurned.toStringAsFixed(0)} kcal', Icons.local_fire_department),
              ],
            ),
            SizedBox(height: 4),
            _buildWorkoutTypeChip(workout.type),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionPill(String label, String value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$value',
        style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildWorkoutChip(String text, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _buildWorkoutTypeChip(String type) {
    Color color;
    switch (type.toLowerCase()) {
      case 'cardio':
        color = Colors.red;
        break;
      case 'strength':
        color = Colors.blue;
        break;
      case 'yoga':
        color = Colors.purple;
        break;
      default:
        color = Colors.grey;
    }
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        type,
        style: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}