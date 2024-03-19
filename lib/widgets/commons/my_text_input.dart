import 'package:bizcotap/utils/app_exports.dart';

class MyTextInput extends StatefulWidget {
  const MyTextInput({
    super.key,
    required this.controller,
    this.inputFormatters,
    required this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
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
  final TextStyle? labelStyle;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffix;
  final FocusNode focusNode;
  final String? Function(String?)? validator;

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
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
      if (newErrorText != errorText) {
        setState(() {
          errorText = newErrorText;
          // Update the errorTextHeight to show/hide the error message
          errorTextHeight = errorText != '' ? 20.0 : 0.0;
        });
      }
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(updateErrorText);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: const CustomOutlineInputBorder(),
            floatingLabelStyle: TextStyle(
              color: AppColors.dark,
              fontSize: getSizeByScreenWidth(
                context,
                3.7,
              ),
            ),
            labelText: widget.labelText,
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
        const SizedBox(height: 3),
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
