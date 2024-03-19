import 'package:bizcotap/utils/app_exports.dart';

class ExportContactsScreen extends StatelessWidget {
  const ExportContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Export Contacts',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: const Center(
        child: MyText(
          text: 'Export contacts Screen',
        ),
      ),
    );
  }
}
