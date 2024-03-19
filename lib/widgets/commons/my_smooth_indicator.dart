import 'package:bizcotap/utils/app_exports.dart';

class MySmoothIndicator extends StatelessWidget {
  const MySmoothIndicator({
    super.key,
    required this.controller,
    this.count = 3,
    this.dotWidth = 7,
    this.dotHeight = 7,
    this.activeDotColor = AppColors.light,
    this.dotColor = AppColors.lighterDark,
  });

  final PageController controller;
  final int count;
  final Color activeDotColor;
  final Color dotColor;
  final double dotWidth;
  final double dotHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0.95),
      child: SmoothPageIndicator(
        controller: controller,
        count: count,
        effect: WormEffect(
          dotWidth: dotWidth,
          dotHeight: dotHeight,
          activeDotColor: activeDotColor,
          dotColor: dotColor,
        ),
      ),
    );
  }
}
