import 'package:bizcotap/utils/app_exports.dart';

class MySubscriptionsScreen extends StatelessWidget {
  const MySubscriptionsScreen({super.key});

  // Function to open the bottom sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      elevation: 10,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const SubscriptionBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'My Subscriptions',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: getSizeByScreenWidth(context, 10),
                  height: getSizeByScreenHeight(context, 10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.green,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MySvg(assetName: AppConstants.unlockSvg),
                  ),
                ),
                const MySizedBox(width: 2),
                const Flexible(
                  child: MyText(
                    text:
                        "Unlock 20% savings with an annual plan! Tap the pencil icon to upgrade.",
                    color: AppColors.lighterDark,
                  ),
                )
              ],
            ),
            MyCardWithPatterns(
              contentWidget: const SubscriptionCardContent(),
              icon: AppIcons.edit,
              tooltip: 'Edit Subscription Plan',
              iconSize: 25,
              onPressed: () {
                _showBottomSheet(context);
              },
              backgroundColor: AppColors.light,
            ),
            const MySizedBox(height: 3),
            const Row(
              children: [
                MyIcon(icon: AppIcons.info),
                MySizedBox(width: 2),
                MyText(
                  text: 'Renewal Date - 1st June 2024',
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            const MySizedBox(height: 4),
            Row(
              children: [
                MyText(
                  text: "PAYMENT METHODS",
                  color: AppColors.lighterDark,
                  fontWeight: FontWeight.bold,
                  fontSize: getSizeByScreenWidth(context, 3.7),
                ),
              ],
            ),
            const MySizedBox(height: 1),
            MyDivider(
              color: AppColors.lighterDark.withOpacity(0.4),
              width: double.infinity,
            ),
            const PaymentMethodList(),
            const MySizedBox(height: 3),
            Row(
              children: [
                MyText(
                  text: "INVOICE HISTORY",
                  color: AppColors.lighterDark,
                  fontWeight: FontWeight.bold,
                  fontSize: getSizeByScreenWidth(context, 3.7),
                ),
              ],
            ),
            const MySizedBox(height: 1),
            MyDivider(
              color: AppColors.lighterDark.withOpacity(0.4),
              width: double.infinity,
            ),
            const Expanded(
              child: InvoiceList(),
            ),
            const MySizedBox(height: 2),
            Padding(
              padding:
                  EdgeInsets.only(bottom: getSizeByScreenHeight(context, 3)),
              child: MyOutlinedButton(
                onPressed: () {},
                text: const MyText(
                  text: 'Unsubscribe',
                  color: AppColors.background,
                ),
                buttonColor: const MaterialStatePropertyAll(
                  AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
