import 'package:bizcotap/utils/app_exports.dart';

class PaymentCardContent extends StatelessWidget {
  const PaymentCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'Pro plan',
          color: AppColors.light,
          fontWeight: FontWeight.normal,
          fontSize: getSizeByScreenWidth(context, 3.5),
        ),
        MyText(
          text: '\$ 10',
          color: AppColors.light,
          fontWeight: FontWeight.bold,
          fontSize: getSizeByScreenWidth(context, 6.3),
        ),
        MyText(
          text: "Starting today 22 May 2023",
          color: AppColors.light,
          fontWeight: FontWeight.normal,
          fontSize: getSizeByScreenWidth(context, 3.5),
          lineHeight: 1,
        ),
      ],
    );
  }
}
