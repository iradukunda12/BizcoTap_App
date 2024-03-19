import 'package:bizcotap/utils/app_exports.dart';

class SubscriptionBottomSheet extends StatefulWidget {
  const SubscriptionBottomSheet({super.key});

  @override
  State<SubscriptionBottomSheet> createState() =>
      _SubscriptionBottomSheetState();
}

class _SubscriptionBottomSheetState extends State<SubscriptionBottomSheet> {
  String selectedOption = '';
  bool _isButtonDisabled = true;

  // Update _isButtonDisabled when the selection changes
  void updateButtonState() {
    setState(() {
      _isButtonDisabled = selectedOption.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getSizeByScreenHeight(context, 84),
      padding: EdgeInsets.symmetric(
        horizontal: getSizeByScreenHeight(context, 4),
        vertical: getSizeByScreenWidth(context, 1),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: "Upgrade to",
                    fontWeight: FontWeight.bold,
                    fontSize: getSizeByScreenWidth(context, 6),
                  ),
                  SizedBox(
                    width: getSizeByScreenWidth(context, 1),
                  ),
                  MyImage(
                    imagePath: AppConstants.pro,
                    width: getSizeByScreenWidth(context, 12),
                  )
                ],
              ),
              SizedBox(
                height: getSizeByScreenHeight(context, 3),
              ),
              const MyText(
                  textAlign: TextAlign.center,
                  text:
                      'Upgrade to a pro account and start enjoying other premium services including:'),
              SizedBox(
                height: getSizeByScreenHeight(context, 2.5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: featuresDataList
                    .map(
                      (data) => CustomCheckRow(
                        data: data,
                      ),
                    )
                    .toList(),
              )
            ],
          ),
          SizedBox(
            height: getSizeByScreenHeight(context, 3),
          ),
          MyDivider(
            width: double.infinity,
            color: AppColors.lighterDark.withOpacity(0.5),
          ),
          SizedBox(
            height: getSizeByScreenHeight(context, 3),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyText(text: "Select Plan"),
              SizedBox(
                height: getSizeByScreenHeight(context, 1),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: planListData.map((plan) {
                  final isLastPlan = plan == planListData.last;
                  return Column(
                    children: [
                      PlanContainer(
                        label: plan.label,
                        value: plan.value,
                        planType: plan.planType,
                        selectedOption: selectedOption,
                        onChanged: () {
                          setState(() {
                            selectedOption = plan.label;
                            updateButtonState();
                          });
                        },
                        additionalText: plan.additionalText,
                        border: Border.all(
                          color: selectedOption == plan.label
                              ? AppColors.primary.withOpacity(0.5)
                              : AppColors.light,
                          width: 1,
                        ),
                      ),
                      if (!isLastPlan)
                        SizedBox(
                          height: getSizeByScreenHeight(context, 2),
                        ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(
            height: getSizeByScreenHeight(context, 5),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MyOutlinedButton(
              onPressed: disableButtonIf(_isButtonDisabled, () {
                Navigator.pushNamed(context, '/payment');
              }),
              buttonColor: MaterialStateProperty.all(
                _isButtonDisabled
                    ? AppColors.lighterDark.withOpacity(0.5)
                    : AppColors.primary,
              ),
              height: getSizeByScreenHeight(context, 6),
              text: const MyText(
                text: 'Upgrade to Pro',
                color: AppColors.light,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
