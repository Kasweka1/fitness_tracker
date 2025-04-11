import 'package:fitness_tracker/config/theme.dart';
import 'package:fitness_tracker/widgets/track/pulsatingCircle.dart';
import 'package:fitness_tracker/widgets/track/statWidget.dart';
import 'package:flutter/material.dart';

class RunningScreen extends StatelessWidget {
  const RunningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBlue,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.primaryWhite, // Set the back icon color to white
        ),
        title: const Text(
          'Running',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 20,
            color: AppColors.primaryWhite,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Your main page content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Pulsating circle card
                PulsatingCircle(
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 12,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '7.00',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Kilometers',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Stats below the circle
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    StatWidget(label: 'Avg Pace', value: '5\'32"'),
                    StatWidget(label: 'Heart Rate', value: '138 bpm'),
                    StatWidget(label: 'Duration', value: '35:12'),
                  ],
                ),
              ],
            ),
          ),

          // Floating bottom card
          Positioned(
            left: 16,
            right: 16,
            bottom: 35,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt, size: 20),
                    onPressed: () {
                      // Watch feature
                    },
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue, // or AppColors.primaryBlue
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.pause, color: AppColors.primaryWhite, size: 25),
                      onPressed: () {
                        // Start workout
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.music_note_outlined, size: 20),
                    onPressed: () {
                      // Open music controls
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
