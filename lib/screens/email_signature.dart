import 'package:bizcotap/utils/app_exports.dart';

class EmailSignatureScreen extends StatelessWidget {
  const EmailSignatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Email Signature',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: getSizeByScreenHeight(context, 8),
            left: getSizeByScreenWidth(context, 4),
            right: getSizeByScreenWidth(context, 4)),
        child: const Column(
          children: [
            ProfileCard(),
            MySizedBox(height: 6),
            ImportButtons(),
          ],
        ),
      ),
    );
  }
}
