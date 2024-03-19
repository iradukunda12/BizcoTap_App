import 'package:bizcotap/utils/app_exports.dart';

class ConnectWithAndroidsScreen extends StatelessWidget {
  const ConnectWithAndroidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Connect with androids',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: const Center(
        child: MyText(
          text: 'Connect with  androids',
        ),
      ),
    );
  }
}
