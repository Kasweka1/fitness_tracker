import 'package:flutter/material.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({Key? key}) : super(key: key);

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
            accountName: const Text('Samantha'),
            accountEmail: const Text('sam@example.com'),
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
              // Handle logout
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
