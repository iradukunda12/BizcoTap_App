import 'package:bizcotap/utils/app_exports.dart';

class MyTextIconButton extends StatelessWidget {
  const MyTextIconButton({
    super.key,
    this.prefixIcon,
    required this.textWidget,
    this.iconWidget,
    required this.onPressed,
  });

  final Widget? prefixIcon;
  final Widget textWidget;
  final Widget? iconWidget;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (prefixIcon != null) prefixIcon!,
                if (prefixIcon != null)
                  const MySizedBox(
                    width: 3,
                  ),
                textWidget,
              ],
            ),
            const MySizedBox(
              width: 1.5,
            ),
            if (iconWidget != null) iconWidget!,
          ],
        ),
      ),
    );
  }
}
