import 'package:fitness_tracker/services/models/user.dart';
import 'package:flutter/material.dart';

class MyAppDrawer extends StatelessWidget {
  final User user;
  const MyAppDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: colors.primary),
            currentAccountPicture: CircleAvatar(
              backgroundColor: colors.onPrimary,
              child: Icon(
                Icons.person,
                size: 40,
                color: colors.primary,
              ),
            ),
            accountName: Text(user.username),
            accountEmail: Text(user.email),
          ),

          // Profile
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('My Profile'),
            onTap: () {},
          ),

          // Plans
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('My Plans'),
            onTap: () {},
          ),

          // Achievements
          ListTile(
            leading: const Icon(Icons.emoji_events),
            title: const Text('Achievements'),
            onTap: () {},
          ),

          // Preferences
          ListTile(
            leading: const Icon(Icons.tune),
            title: const Text('Preferences'),
            onTap: () {},
          ),

          const Spacer(),

          // Logout
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
