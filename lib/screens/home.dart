import 'package:fitness_tracker/screens/home_tabs/diet_tab.dart';
import 'package:fitness_tracker/screens/home_tabs/home_tab.dart';
import 'package:fitness_tracker/screens/home_tabs/report_tab.dart';
import 'package:fitness_tracker/screens/home_tabs/settings_tab.dart';
import 'package:fitness_tracker/screens/widgets/drawer.dart';
import 'package:fitness_tracker/services/models/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
    final User user;
  const HomePage({super.key,  required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    HomeTab(),
    ReportTab(),
    DietTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      drawer:  MyAppDrawer(user: widget.user),
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 2,
        toolbarHeight: 70,
        automaticallyImplyLeading: false, // disables default back/menu icon
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left: Greeting
            Text(
              'Good Day, ${widget.user.username}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontSize: 20,
                color: colors.primary,
              ),
            ),

            // Right: Icons
            Row(
              children: [
                Icon(Icons.notifications_none, color: colors.primary),
                const SizedBox(width: 12),
                Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: CircleAvatar(
                      backgroundColor: colors.primaryContainer,
                      child: Icon(Icons.person, color: colors.primary),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.onPrimaryContainer,
        backgroundColor: colors.surface,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 0 ? Icons.home : Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 1 ? Icons.analytics : Icons.analytics_outlined,
            ),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 2 ? Icons.fastfood : Icons.fastfood_outlined,
            ),
            label: 'Diet',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 3 ? Icons.settings : Icons.settings_outlined,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
