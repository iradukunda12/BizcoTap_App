import 'package:bizcotap/utils/app_exports.dart';

class PaymentInput extends StatefulWidget {
  const PaymentInput({
    super.key,
    required this.controller,
    this.inputFormatters,
    this.keyboardType = TextInputType.number,
    this.obscureText = false,
    this.enabled = true,
    required this.hintText,
    required this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffix,
    required this.focusNode,
    this.validator,
  });

  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enabled;
  final String labelText;
  final String hintText;
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffix;
  final FocusNode focusNode;
  final String? Function(String?)? validator;

  @override
  State<PaymentInput> createState() => _PaymentInputState();
}

class _PaymentInputState extends State<PaymentInput> {
  String? errorText;
  double errorTextHeight = 0;

  @override
  void initState() {
    super.initState();
    // Listen to changes in the controller and update the errorText
    widget.controller.addListener(updateErrorText);
  }

  void updateErrorText() {
    if (widget.validator != null) {
      final text = widget.controller.text;
      final newErrorText = widget.validator!(text);
      final shouldShowError = newErrorText != null && newErrorText.isNotEmpty;

      setState(() {
        errorText = newErrorText;
        errorTextHeight = shouldShowError ? 20.0 : 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.lighterDark.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: getSizeByScreenWidth(context, 3)),
          child: TextFormField(
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: InputBorder.none,
              floatingLabelStyle: TextStyle(
                color: AppColors.dark,
                fontSize: getSizeByScreenWidth(
                  context,
                  3.7,
                ),
              ),
              labelText: widget.labelText,
              hintText: widget.hintText,
              labelStyle: widget.labelStyle,
              prefixIcon: widget.prefixIcon,
              prefixIconColor: widget.prefixIconColor,
              suffix: widget.suffix,
            ),
            inputFormatters: widget.inputFormatters,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            enabled: widget.enabled,
            focusNode: widget.focusNode,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          height: errorTextHeight,
          child: MyText(
            text: errorText ?? '',
            color: AppColors.danger,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
