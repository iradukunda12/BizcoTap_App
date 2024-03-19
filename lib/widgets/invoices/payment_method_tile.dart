import 'package:bizcotap/data/model/payment_methods_data.dart';
import 'package:bizcotap/utils/app_exports.dart';
import 'package:bizcotap/utils/mask_card_number.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({
    super.key,
    required this.data,
  });

  final Methods data;

  String getPaymentMethodImagePath() {
    String cardType = data.type.toLowerCase();

    switch (cardType) {
      case 'visa':
        return 'assets/payment/visa.png';
      case 'mastercard':
        return 'assets/payment/mastercard.png';
      case 'american express':
        return 'assets/payment/american_express.png';
      default:
        return 'assets/payment/visa.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MySizedBox(height: 2),
        Row(
          children: [
            MyImage(
              imagePath: getPaymentMethodImagePath(),
              width: getSizeByScreenWidth(context, 10),
            ),
            const MySizedBox(width: 2),
            MyText(
              text: maskCardNumber(data.cardNumber),
              fontSize: getSizeByScreenWidth(context, 4.2),
            ),
            const Spacer(),
            MyText(
              text: "Expires ${data.dateOfExpiry}",
              fontSize: getSizeByScreenWidth(context, 4),
              color: AppColors.dark,
            ),
          ],
        ),
      ],
    );
  }
}
