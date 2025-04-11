import 'package:fitness_tracker/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:fitness_tracker/config/theme.dart';
import 'package:fitness_tracker/screens/track/start_track.dart';
import 'package:fitness_tracker/utils/icons/customeMenuIcon.dart';
import 'package:fitness_tracker/widgets/home/fitnessCard.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyAppDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBlue,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const CustomMenuIcon(color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Or use GlobalKey
            },
          ),
        ),
        title: const Text(
          'Fitness Tracker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 20,
            color: AppColors.primaryWhite,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColors.primaryWhite,
            ),
            onPressed: () {
              // Handle search logic here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Activities',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontSize: 17,
                color: AppColors.primaryWhite,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FitnessCard(
                    title: 'Workout',
                    subtitle: '30 min daily plan',
                    icon: Icons.fitness_center,
                    onTap: () {
                      // Navigate or show workout tips
                    },
                  ),
                  FitnessCard(
                    title: 'Nutrition',
                    subtitle: 'Track your meals',
                    icon: Icons.local_dining,
                    onTap: () {},
                  ),
                  FitnessCard(
                    title: 'Hydration',
                    subtitle: '8 glasses today?',
                    icon: Icons.water_drop,
                    onTap: () {},
                  ),
                  FitnessCard(
                    title: 'Sleep',
                    subtitle: '7 hours last night',
                    icon: Icons.nightlight_round,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.play_pause,
        backgroundColor: AppColors.primaryBlue,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
            child: Icon(Icons.directions_run, color: Colors.white),
            backgroundColor: AppColors.primaryBlue,
            label: 'Run',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrackScreen()),
              );
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.fastfood, color: Colors.white),
            backgroundColor: AppColors.primaryBlue,
            label: 'Food',
            onTap: () {
              // Handle food tracking
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.hotel, color: Colors.white),
            backgroundColor: AppColors.primaryBlue,
            label: 'Stats',
            onTap: () {
              // Handle sleep action
            },
          ),
        ],
      ),
    );
  }
}
