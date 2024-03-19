import 'package:bizcotap/utils/app_exports.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
    this.maxLines,
    this.overflow,
    this.lineHeight = 0,
    this.textShadow,
  });

  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double lineHeight;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final TextOverflow? overflow;
  final List<Shadow>? textShadow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'SofiaFont',
        fontSize: fontSize ?? getSizeByScreenWidth(context, 4),
        color: color ?? AppColors.dark,
        fontWeight: fontWeight,
        decoration: textDecoration,
        shadows: textShadow,
      ),
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
      strutStyle: StrutStyle(
        height: lineHeight,
        leading: 0.8,
      ),
    );
  }
}
