import 'package:bizcotap/utils/app_exports.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTapOutside;
  final InputDecoration? decoration;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.maxLines,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.onTapOutside,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      decoration: decoration ??
          InputDecoration(
            labelText: label,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      enabled: enabled,
    );
  }
}
