import 'package:bizcotap/utils/app_exports.dart';

class BDropScreen extends StatelessWidget {
  const BDropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyAppBar(
      title: TitleWidget(),
      actions: [NotificationAction()],
      body: Center(
        child: MyText(text: 'bDrop'),
      ),
    );
  }
}
