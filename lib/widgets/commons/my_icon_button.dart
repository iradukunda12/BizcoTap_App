import 'package:bizcotap/utils/app_exports.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.backgroundColor,
    this.size = 32,
    this.iconColor,
  });

  final void Function() onPressed;
  final IconData icon;
  final String tooltip;
  final double size;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: size,
        color: iconColor,
      ),
      tooltip: tooltip,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          backgroundColor,
        ),
      ),
    );
  }
}
