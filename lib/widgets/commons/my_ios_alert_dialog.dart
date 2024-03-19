import 'package:bizcotap/utils/app_exports.dart';
import 'package:flutter/cupertino.dart';

class CupertinoReusableAlertDialog extends StatelessWidget {
  final Widget? titleWidget;
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

  const CupertinoReusableAlertDialog({
    super.key,
    this.titleWidget,
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
    return CupertinoAlertDialog(
      title: titleWidget,
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
        CupertinoDialogAction(
          child: const Text(
            'ok',
            style: TextStyle(color: AppColors.dark),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
