import 'package:bizcotap/utils/app_exports.dart';

class Security {
  const Security({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;
}

const securityData = '''
End-to-end encryption safeguards your personal information and shared/exchanged contacts when using our bizcotap tags, ensuring that Bizcotap or any unauthorized party cannot access or misuse your data. This robust security extends to:

''';

List<Security> securityListData = [
  const Security(
    icon: Icons.location_on,
    title: 'Your live locations',
  ),
  const Security(
    icon: Icons.call,
    title: 'Your contact information',
  ),
  const Security(
    icon: Icons.add_moderator,
    title: 'Your networking data',
  ),
];
