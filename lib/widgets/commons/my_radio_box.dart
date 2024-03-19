import 'package:bizcotap/utils/app_exports.dart';

class CustomRadioButton extends StatelessWidget {
  final bool selected;
  final void Function() onChanged;

  const CustomRadioButton({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? AppColors.primary : AppColors.light,
          border: Border.all(
            color: AppColors.lighterDark.withOpacity(0.5),
            width: 2,
            strokeAlign: 4,
          ),
        ),
      ),
    );
  }
}
