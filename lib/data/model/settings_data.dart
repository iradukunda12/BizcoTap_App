import 'package:bizcotap/utils/app_exports.dart';

class SettingsItem {
  final IconData icon;
  final String label;
  final String routeName;

  SettingsItem({
    required this.icon,
    required this.label,
    required this.routeName,
  });
}

class SettingsSection {
  final String title;
  final List<SettingsItem> items;

  SettingsSection({
    required this.title,
    required this.items,
  });
}

List<SettingsSection> sectionsDataList = [
  SettingsSection(
    title: 'Account',
    items: [
      SettingsItem(
        icon: Icons.person,
        label: 'Edit Profile',
        routeName: '/edit-profile',
      ),
      SettingsItem(
        icon: Icons.security,
        label: 'Security Information',
        routeName: '/security',
      ),
      SettingsItem(
        icon: Icons.notifications,
        label: 'Enable Notifications',
        routeName: '/notification-settings',
      ),
    ],
  ),
  SettingsSection(
    title: 'Support & About',
    items: [
      SettingsItem(
        icon: Icons.subscriptions,
        label: 'My Subscriptions',
        routeName: '/my-subscriptions',
      ),
      SettingsItem(
        icon: Icons.help,
        label: 'Help & Support',
        routeName: '/help-and-support',
      ),
      SettingsItem(
        icon: Icons.policy,
        label: 'Terms & Policies',
        routeName: '/terms-and-policies',
      ),
    ],
  ),
  SettingsSection(
    title: 'Actions',
    items: [
      SettingsItem(
        icon: Icons.flag,
        label: 'Report a Problem',
        routeName: '/report-a-problem',
      ),
      SettingsItem(
        icon: Icons.pin,
        label: 'Enable PIN',
        routeName: '/create-pin',
      ),
      SettingsItem(
        icon: Icons.logout,
        label: 'Logout',
        routeName: '/login',
      ),
    ],
  ),
];
