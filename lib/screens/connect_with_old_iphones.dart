import 'package:bizcotap/utils/app_exports.dart';

class ConnectWithOldIphonesScreen extends StatelessWidget {
  const ConnectWithOldIphonesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Connect with old iphones',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: const Center(
        child: MyText(
          text: 'Connect with old iphones',
        ),
      ),
    );
  }
}
