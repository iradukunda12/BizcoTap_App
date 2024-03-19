import 'package:bizcotap/utils/app_exports.dart';

class PlanContainer extends StatelessWidget {
  const PlanContainer({
    super.key,
    required this.label,
    required this.value,
    required this.planType,
    required this.selectedOption,
    required this.onChanged,
    required this.additionalText,
    required this.border,
  });

  final String label;
  final String value;
  final String planType;
  final String selectedOption;
  final void Function() onChanged;
  final String additionalText;
  final BoxBorder border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getSizeByScreenWidth(context, 6),
        ),
        width: double.infinity,
        height: getSizeByScreenHeight(context, 13),
        decoration: BoxDecoration(
          color: AppColors.light,
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
          border: border,
        ),
        child: Row(
          children: [
            CustomRadioButton(
              selected: selectedOption == label,
              onChanged: onChanged,
            ),
            const MySizedBox(
              width: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: label,
                  fontSize: getSizeByScreenWidth(context, 4),
                  fontWeight: FontWeight.normal,
                ),
                Row(
                  children: [
                    MyText(
                      text: value,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      text: " /$planType",
                      fontSize: getSizeByScreenWidth(context, 3),
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
                MyText(
                  text: additionalText,
                  fontSize: getSizeByScreenWidth(context, 3),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
