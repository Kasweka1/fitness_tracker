import 'package:fitness_tracker/config/theme.dart';
import 'package:fitness_tracker/screens/track/tracking.dart';
import 'package:flutter/material.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({Key? key}) : super(key: key);

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
          'Start Tracking',
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
            child: Text(
              'Tracking Map',
              style: Theme.of(context).textTheme.titleLarge,
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
                    icon: Icon(Icons.watch_later_outlined, size: 20),
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
                      icon: Icon(Icons.play_arrow,
                          color: AppColors.primaryWhite, size: 25),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RunningScreen()),
                        );
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
