import 'package:bizcotap/utils/app_exports.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.height = 50,
    this.width = double.infinity,
    this.borderRadius = Dimens.borderRadius,
    this.buttonColor,
    this.borderColor = AppColors.light,
  });

  final void Function()? onPressed;
  final Widget text;
  final Widget? icon;
  final double height;
  final double width;
  final double borderRadius;
  final MaterialStateProperty<Color?>? buttonColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(
            color: borderColor,
            width: Dimens.borderWidth,
          ),
        ),
        backgroundColor: buttonColor,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: width,
        height: height,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: (icon != null)
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [text, if (icon != null) icon!]),
      ),
    );
  }
}
