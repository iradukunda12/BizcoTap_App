import 'package:bizcotap/utils/app_exports.dart';
import 'package:flutter/cupertino.dart';

class MaterialAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final Function? onPressed;
  final Color titleColor;
  final Color contentColor;
  final Color buttonColor;
  final TextStyle titleTextStyle;
  final TextStyle contentTextStyle;
  final TextStyle buttonTextStyle;
  final double borderWidth;
  final EdgeInsets contentPadding;
  final Widget customImage; // Add a custom image widget

  const MaterialAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.onPressed,
    this.titleColor = Colors.black,
    this.contentColor = Colors.black,
    this.buttonColor = Colors.blue,
    this.titleTextStyle = const TextStyle(),
    this.contentTextStyle = const TextStyle(),
    this.buttonTextStyle = const TextStyle(),
    this.borderWidth = 0,
    this.contentPadding = EdgeInsets.zero,
    required this.customImage,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: AppColors.background,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: getSizeByScreenWidth(context, borderWidth),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleTextStyle.copyWith(color: titleColor),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 80, child: customImage),
          const SizedBox(
            height: 20,
          ),
          MyText(
            text: content,
            fontSize: getSizeByScreenWidth(context, 3.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        Center(
          child: Container(
            height: getSizeByScreenHeight(context, 5),
            width: getSizeByScreenWidth(context, 15),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadiusDirectional.circular(
                getSizeByScreenWidth(context, 2),
              ),
            ),
            child: CupertinoDialogAction(
              child: const MyText(
                text: 'Ok',
                color: AppColors.background,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ],
    );
  }
}
