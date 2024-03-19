import 'package:bizcotap/utils/app_exports.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  String selectedOption = '';
  bool _isButtonDisabled = true;

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardNameController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvCodeController = TextEditingController();

  final FocusNode cardNumberFocusNode = FocusNode();
  final FocusNode cardNameFocusNode = FocusNode();
  final FocusNode cvvFocusNode = FocusNode();
  final FocusNode expiryDateNode = FocusNode();

  CardType cardType = CardType.unknown;

  void getCardTypeFromNum() {
    // With in first 6 digits we can identity the type so
    if (cardNumberController.text.length <= 6) {
      String cardNum = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFromNumber(cardNum);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  @override
  void initState() {
    cardNumberController.addListener(() {
      getCardTypeFromNum();
      _updateButtonState();
    });

    cardNameController.addListener(_updateButtonState);
    expiryDateController.addListener(_updateButtonState);
    cvvCodeController.addListener(_updateButtonState);

    super.initState();
  }

  void _updateButtonState() {
    final isCardNumberValid =
        CardUtils.validateCardNum(cardNumberController.text) == null;
    final isCardNameValid =
        CardUtils.validateCardHolderName(cardNameController.text) == null;
    final isExpiryDateValid =
        CardUtils.validateDate(expiryDateController.text) == null;
    final isCvvValid = CardUtils.validateCVV(cvvCodeController.text) == null;

    setState(() {
      _isButtonDisabled = !isCardNumberValid ||
          !isCardNameValid ||
          !isExpiryDateValid ||
          !isCvvValid ||
          cardNumberController.text.isEmpty ||
          cardNameController.text.isEmpty ||
          expiryDateController.text.isEmpty ||
          cvvCodeController.text.isEmpty;
    });
  }

  void _handleConfirmButtonPress() {
    Navigator.of(context).pushNamed('/my-subscriptions');
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Update to Pro',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          right: getSizeByScreenWidth(context, 4),
          left: getSizeByScreenWidth(context, 4),
          bottom: getSizeByScreenHeight(context, 4),
          top: getSizeByScreenHeight(context, 1),
        ),
        child: Column(
          children: [
            MyCardWithPatterns(
              contentWidget: const PaymentCardContent(),
              icon: AppIcons.edit,
              tooltip: 'Edit Subscription Plan',
              iconSize: 20,
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: AppColors.light,
            ),
            SizedBox(
              height: getSizeByScreenHeight(context, 1),
            ),
            MyDivider(
              width: double.infinity,
              color: AppColors.lightDark.withOpacity(0.2),
            ),
            SizedBox(
              height: getSizeByScreenHeight(context, 2),
            ),
            PaymentForm(
              formKey: _formKey,
              cardNumber: cardNumberController.text,
              cardName: cardNameController.text,
              expiryDate: expiryDateController.text,
              cvvCode: cvvCodeController.text,
              cardNumberController: cardNumberController,
              cardNameController: cardNameController,
              cvvCodeController: cvvCodeController,
              expiryDateController: expiryDateController,
              cardNumberFocusNode: cardNumberFocusNode,
              cardNameFocusNode: cardNameFocusNode,
              cvvFocusNode: cvvFocusNode,
              expiryDateNode: expiryDateNode,
              cardType: cardType,
            ),
            const MyInfoTag(
              iconWidget: MySvg(
                assetName: AppConstants.safetyIcon,
              ),
              text: "Card information is secure",
            ),
            const Spacer(),
            MyOutlinedButton(
              onPressed:
                  disableButtonIf(_isButtonDisabled, _handleConfirmButtonPress),
              text: const MyText(
                text: 'Confirm',
                color: AppColors.light,
              ),
              buttonColor: MaterialStateProperty.all(
                _isButtonDisabled
                    ? AppColors.lighterDark.withOpacity(0.5)
                    : AppColors.primary,
              ),
              height: getSizeByScreenHeight(context, 6),
            ),
          ],
        ),
      ),
    );
  }
}
