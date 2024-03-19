import 'package:bizcotap/utils/app_exports.dart';

class HelpAndSupportData {
  final String imagePath;
  final String title;
  final String subtitle;
  final String route;

  HelpAndSupportData({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.route,
  });
}

List<HelpAndSupportData> dummyDataList = [
  HelpAndSupportData(
      title: 'Connect with QR Code',
      subtitle: 'Sample Subtitle 2 - 1',
      imagePath: AppConstants.qrSupportImage,
      route: '/connect-with-qr-code'),
  HelpAndSupportData(
      title: 'Connect with new iPhones',
      subtitle: 'Sample Subtitle 2 - 2',
      imagePath: AppConstants.qrSupportImage,
      route: '/connect-with-new-iphones'),
  HelpAndSupportData(
      title: 'Connect with old iphones',
      subtitle: 'Sample Subtitle 2 - 3',
      imagePath: AppConstants.qrSupportImage,
      route: '/connect-with-old-iphones'),
  HelpAndSupportData(
      title: 'Connect with Androids',
      subtitle: 'Sample Subtitle 2 - 4',
      imagePath: AppConstants.qrSupportImage,
      route: '/connect-with-androids'),
];
