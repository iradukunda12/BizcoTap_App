import 'package:bizcotap/utils/app_exports.dart';

class AddContactScreen extends StatelessWidget {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Add Contact',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w800,
      ),
      centerTitle: false,
      actions: const [NotificationAction()],
      body: const Center(
        child: MyText(text: 'Add Contact Screen'),
      ),
    );
  }
}
