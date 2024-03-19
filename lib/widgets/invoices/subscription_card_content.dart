import '../../utils/app_exports.dart';

class SubscriptionCardContent extends StatelessWidget {
  const SubscriptionCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'Monthly Plan',
          color: AppColors.light,
          fontWeight: FontWeight.bold,
          fontSize: getSizeByScreenWidth(context, 3.5),
        ),
        MyText(
          text: '\$ 10',
          color: AppColors.light,
          fontWeight: FontWeight.bold,
          fontSize: getSizeByScreenWidth(context, 6.3),
        ),
        MyText(
          text: "Renewal Date - 1st June 2024",
          color: AppColors.light,
          fontWeight: FontWeight.normal,
          fontSize: getSizeByScreenWidth(context, 3.5),
          lineHeight: 1,
        ),
      ],
    );
  }
}
