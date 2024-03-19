import 'package:bizcotap/utils/app_exports.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
    this.width,
    this.color,
  });

  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? getSizeByScreenWidth(context, 28),
      height: 1,
      color: color ?? AppColors.lightDark,
    );
  }
}
