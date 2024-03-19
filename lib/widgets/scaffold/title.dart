import 'package:bizcotap/utils/app_exports.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // avatar Widget
    Widget avatarWidget = CircleAvatar(
      radius: getSizeByScreenWidth(context, 6),
      backgroundColor: AppColors.primary,
      child: const MyText(
        text: 'JN',
        color: AppColors.light,
        fontWeight: FontWeight.bold,
      ),
    );

    // name widget
    Widget nameWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(
              text: 'Hello, John',
              fontSize: getSizeByScreenWidth(context, 5.5),
              color: AppColors.dark,
              fontWeight: FontWeight.w800,
            ),
            const SizedBox(
              width: 8,
            ),
            const MyIcon(
              icon: AppIcons.wavingHand,
              size: 24,
              color: AppColors.accent,
            ),
          ],
        ),
        const MyText(
          text: 'Welcome to Bizcotap',
          color: AppColors.lightDark,
          lineHeight: 0,
        )
      ],
    );

    return Row(
      children: [
        avatarWidget,
        SizedBox(
          width: getSizeByScreenWidth(context, 2),
        ),
        nameWidget,
      ],
    );
  }
}
