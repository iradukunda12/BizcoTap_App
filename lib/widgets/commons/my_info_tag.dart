import 'package:bizcotap/utils/app_exports.dart';

class MyInfoTag extends StatelessWidget {
  const MyInfoTag({
    super.key,
    required this.iconWidget,
    required this.text,
  });

  final Widget iconWidget;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        iconWidget,
        SizedBox(
          width: getSizeByScreenWidth(context, 1),
        ),
        Flexible(
          child: MyText(
            text: text,
            fontSize: getSizeByScreenWidth(context, 3.5),
            color: AppColors.lighterDark,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
