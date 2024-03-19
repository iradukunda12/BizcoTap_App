import 'package:bizcotap/utils/app_exports.dart';

class CustomCheckRow extends StatelessWidget {
  final SubscriptionFeature data;

  const CustomCheckRow({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: getSizeByScreenHeight(context, 0.5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MySvg(
            assetName: AppConstants.checkSvg,
          ),
          SizedBox(width: getSizeByScreenWidth(context, 5)),
          MyText(
            text: data.text,
          ),
        ],
      ),
    );
  }
}
