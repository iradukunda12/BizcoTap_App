import 'package:bizcotap/utils/app_exports.dart';

class PreviewData {
  final IconData leading;
  final String title;
  final String subtitle;
  final IconData actions;

  PreviewData({
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.actions,
  });
}

List<PreviewData> previewDummyDataList = [
  PreviewData(
      leading: Icons.abc,
      title: 'Company',
      subtitle: 'Bizcotap Ltd',
      actions: Icons.arrow_forward_ios_sharp),
  PreviewData(
      leading: Icons.abc,
      title: 'Tel',
      subtitle: '+250700000000',
      actions: Icons.arrow_forward_ios_sharp),
  PreviewData(
      leading: Icons.abc,
      title: 'Email',
      subtitle: 'bizcotap@gmail.com',
      actions: Icons.arrow_forward_ios_sharp),
  PreviewData(
      leading: Icons.abc,
      title: 'Website',
      subtitle: 'https://www.bizcotap.com',
      actions: Icons.arrow_forward_ios_sharp),
  PreviewData(
      leading: Icons.abc,
      title: 'Address',
      subtitle: 'KK 601 ST',
      actions: Icons.arrow_forward_ios_sharp),
];
