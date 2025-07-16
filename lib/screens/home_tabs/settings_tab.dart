import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Settings',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: colors.primary,
          ),
        ),
        const SizedBox(height: 24),

        // Profile Section
        _SettingsSectionTitle(title: 'Account'),
        _SettingsTile(
          icon: Icons.person,
          title: 'Edit Profile',
          onTap: () {},
        ),
        _SettingsTile(
          icon: Icons.lock,
          title: 'Change Password',
          onTap: () {},
        ),

        const SizedBox(height: 24),

        // Goals Section
        _SettingsSectionTitle(title: 'Goals & Preferences'),
        _SettingsTile(
          icon: Icons.flag,
          title: 'Daily Step Goal',
          trailing: const Text('10,000'),
          onTap: () {},
        ),
        _SettingsTile(
          icon: Icons.local_fire_department,
          title: 'Calorie Target',
          trailing: const Text('2,200 kcal'),
          onTap: () {},
        ),

        const SizedBox(height: 24),

        // Notifications
        _SettingsSectionTitle(title: 'Notifications'),
        SwitchListTile(
          value: true,
          onChanged: (val) {},
          title: const Text('Reminders & Alerts'),
          secondary: const Icon(Icons.notifications),
        ),

        const SizedBox(height: 24),

        // App Theme
        _SettingsSectionTitle(title: 'App Appearance'),
        _SettingsTile(
          icon: Icons.brightness_6,
          title: 'Theme',
          trailing: const Text('Light'), // Or use a toggle logic
          onTap: () {},
        ),

        const SizedBox(height: 24),

        // Legal & Support
        _SettingsSectionTitle(title: 'Privacy & Support'),
        _SettingsTile(
          icon: Icons.privacy_tip,
          title: 'Privacy Policy',
          onTap: () {},
        ),
        _SettingsTile(
          icon: Icons.description,
          title: 'Terms of Use',
          onTap: () {},
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(icon, color: colors.primary),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class _SettingsSectionTitle extends StatelessWidget {
  final String title;

  const _SettingsSectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: colors.primary,
      ),
    );
  }
}

