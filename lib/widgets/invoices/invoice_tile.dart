import 'package:bizcotap/data/model/my_invoice_data.dart';
import 'package:bizcotap/utils/app_exports.dart';

class MyinvoiceTile extends StatelessWidget {
  const MyinvoiceTile({super.key, required this.data});
  final Invoice data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MySizedBox(height: 2),
                MyText(
                  text: data.group,
                  fontSize: getSizeByScreenWidth(context, 4.1),
                  fontWeight: FontWeight.w600,
                ),
                const MySizedBox(height: 0.5),
                MyText(
                  text: data.date$time,
                  fontSize: getSizeByScreenWidth(context, 3.4),
                  color: AppColors.lighterDark,
                ),
              ],
            ),
            const Spacer(),
            MyText(
              text: data.amount,
              color: AppColors.green,
            ),
            IconButton(
              icon: const Icon(AppIcons.open),
              onPressed: () {
                Navigator.pushNamed(context, '/invoice');
              },
              iconSize: getSizeByScreenWidth(context, 5),
            ),
          ],
        ),
      ],
    );
  }
}
