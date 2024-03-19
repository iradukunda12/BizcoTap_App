import 'package:bizcotap/utils/app_exports.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Customer Support',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: getSizeByScreenWidth(context, 4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: 'Choose the device you are sharing to from the below',
              fontSize: getSizeByScreenHeight(context, 2.3),
            ),
            const MySizedBox(
              height: 2,
            ),
            const Expanded(
              child: HelpAndSupportTile(),
            )
          ],
        ),
      ),
    );
  }
}
