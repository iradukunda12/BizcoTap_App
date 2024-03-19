import 'package:bizcotap/utils/app_exports.dart';

class MyRaisedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const MyRaisedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      // - Set button text style, colors, and padding
    );
  }
}
