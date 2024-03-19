import 'package:bizcotap/utils/app_exports.dart';

class MyAppBarItem extends StatelessWidget {
  const MyAppBarItem({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primary : AppColors.lighterDark,
          ),
          MyText(
              fontSize: getSizeByScreenWidth(context, 3.25),
              text: label,
              color: isSelected ? AppColors.primary : AppColors.lighterDark),
        ],
      ),
    );
  }
}
