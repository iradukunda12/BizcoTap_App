import 'package:bizcotap/utils/app_exports.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({
    super.key,
    required this.formKey,
    required this.cardNumber,
    required this.cardName,
    required this.expiryDate,
    required this.cvvCode,
    required this.cardNumberController,
    required this.cardNameController,
    required this.expiryDateController,
    required this.cvvCodeController,
    required this.cardNumberFocusNode,
    required this.cardNameFocusNode,
    required this.cvvFocusNode,
    required this.expiryDateNode,
    required this.cardType,
  });

  final Key formKey;
  final String cardNumber;
  final String cardName;
  final String expiryDate;
  final String cvvCode;
  final TextEditingController cardNumberController;
  final TextEditingController cardNameController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvCodeController;
  final FocusNode cardNumberFocusNode;
  final FocusNode cardNameFocusNode;
  final FocusNode cvvFocusNode;
  final FocusNode expiryDateNode;
  final CardType? cardType;

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          PaymentInput(
            controller: widget.cardNumberController,
            labelText: AppConstants.cardNumber,
            focusNode: widget.cardNumberFocusNode,
            hintText: AppConstants.sixteenX,
            suffix: CardUtils.getCardImage(widget.cardType),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              CardNumberInputFormatter(),
            ],
            validator: (value) => CardUtils.validateCardNum(value),
          ),
          SizedBox(
            height: getSizeByScreenHeight(context, 2),
          ),
          PaymentInput(
            controller: widget.cardNameController,
            labelText: AppConstants.cardName,
            focusNode: widget.cardNameFocusNode,
            hintText: AppConstants.nameHintText,
            keyboardType: TextInputType.name,
            validator: (value) => CardUtils.validateCardHolderName(value),
          ),
          SizedBox(
            height: getSizeByScreenHeight(context, 2),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: getSizeByScreenHeight(context, 10),
                  child: PaymentInput(
                    controller: widget.expiryDateController,
                    labelText: AppConstants.expiryDate,
                    focusNode: widget.expiryDateNode,
                    hintText: AppConstants.cvvHintText,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      CardMonthInputFormatter(),
                    ],
                    validator: (value) => CardUtils.validateDate(value),
                  ),
                ),
              ),
              SizedBox(
                width: getSizeByScreenWidth(context, 3),
              ),
              Expanded(
                child: SizedBox(
                  height: getSizeByScreenHeight(context, 10),
                  child: PaymentInput(
                    controller: widget.cvvCodeController,
                    labelText: AppConstants.cvv,
                    focusNode: widget.cvvFocusNode,
                    hintText: AppConstants.threeX,
                    inputFormatters: [LengthLimitingTextInputFormatter(3)],
                    validator: (value) => CardUtils.validateCVV(value),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
