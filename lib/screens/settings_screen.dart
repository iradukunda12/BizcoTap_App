import 'package:bizcotap/utils/app_exports.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Settings',
        fontSize: getSizeByScreenWidth(context, 5.5),
        color: AppColors.dark,
        fontWeight: FontWeight.w800,
      ),
      centerTitle: false,
      actions: const [NotificationAction()],
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: getSizeByScreenWidth(context, 4.5),
          right: getSizeByScreenWidth(context, 4.5),
          bottom: getSizeByScreenHeight(context, 4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: sectionsDataList.map((section) {
            return SettingsSectionContainer(
              section: section,
            );
          }).toList(),
        ),
      ),
    );
  }
}
