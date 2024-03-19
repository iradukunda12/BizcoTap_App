import 'package:bizcotap/utils/app_exports.dart';

class MyImportButton extends StatelessWidget {
  const MyImportButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.height = 55,
    this.width = double.infinity,
    this.buttonColor,
  });

  final void Function()? onPressed;
  final Widget text;
  final Widget? icon;
  final double height;
  final double width;
  final MaterialStateProperty<Color?>? buttonColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          const BorderSide(
            color: AppColors.light,
            width: Dimens.borderWidth,
          ),
        ),
        backgroundColor: buttonColor,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getSizeByScreenWidth(context, 4),
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null) icon!,
              SizedBox(
                width: getSizeByScreenWidth(context, 6),
              ),
              text,
            ],
          ),
        ),
      ),
    );
  }
}
