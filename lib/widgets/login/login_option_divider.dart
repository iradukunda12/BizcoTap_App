import 'package:bizcotap/utils/app_exports.dart';

class LoginOptionDivider extends StatelessWidget {
  const LoginOptionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const MyDivider(),
        MyText(
          text: 'Or login with',
          fontSize: getSizeByScreenWidth(
            context,
            4,
          ),
        ),
        const MyDivider(),
      ],
    );
  }
}
