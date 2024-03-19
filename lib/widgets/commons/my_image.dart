import 'package:bizcotap/utils/app_exports.dart';

class MyImage extends StatelessWidget {
  const MyImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit,
    this.color,
  });

  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
