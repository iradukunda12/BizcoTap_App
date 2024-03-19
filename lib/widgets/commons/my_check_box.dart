import 'package:bizcotap/utils/app_exports.dart';

class MyCheckBox extends StatelessWidget {
  const MyCheckBox({
    super.key,
    required this.isChecked,
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.lighterDark,
    this.labelWidget,
    required this.onChanged,
  });

  final bool isChecked;
  final Color activeColor;
  final Color inactiveColor;
  final Widget? labelWidget;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isChecked ? activeColor : inactiveColor,
                width: 2,
              ),
              color: isChecked ? activeColor : Colors.transparent,
            ),
            child: isChecked
                ? const Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  )
                : null,
          ),
          const SizedBox(width: 8),
          if (labelWidget != null) labelWidget!,
        ],
      ),
    );
  }
}
