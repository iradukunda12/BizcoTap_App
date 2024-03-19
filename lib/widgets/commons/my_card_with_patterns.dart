import 'package:bizcotap/utils/app_exports.dart';

class MyCardWithPatterns extends StatelessWidget {
  const MyCardWithPatterns({
    super.key,
    required this.contentWidget,
    required this.icon,
    this.iconSize = 32,
    required this.tooltip,
    required this.onPressed,
    required this.backgroundColor,
  });

  final Widget contentWidget;
  final IconData icon;
  final double iconSize;
  final String tooltip;
  final void Function() onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getSizeByScreenHeight(context, 2.5),
        horizontal: getSizeByScreenWidth(context, 5),
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AppConstants.cardPattern),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          contentWidget,
          const Spacer(),
          MyIconButton(
            size: iconSize,
            icon: icon,
            tooltip: tooltip,
            onPressed: onPressed,
            backgroundColor: backgroundColor,
          ),
        ],
      ),
    );
  }
}
