import 'package:bizcotap/utils/app_exports.dart';

class MyCircularFloatingActionButton extends StatelessWidget {
  const MyCircularFloatingActionButton({
    super.key,
    required this.onPressed,
    this.size = 56.0,
    this.backgroundColor = AppColors.primary,
    required this.icon,
    this.elevation = 10,
  });

  final void Function() onPressed;
  final double size;
  final Color backgroundColor;
  final IconData icon;
  final double elevation;

  Future<void> _handleTap() async {
    final hasVibrator = await Vibration.hasVibrator();

    if (hasVibrator == true) {
      // Define a custom vibration pattern in milliseconds
      final pattern = [200, 100, 200];

      // Vibrate with the custom pattern
      await Vibration.vibrate(pattern: pattern);
    }

    onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: const Center(
          child: MySvg(assetName: AppConstants.bdropSvg),
        ),
      ),
    );
  }
}
