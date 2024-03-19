import 'package:bizcotap/utils/app_exports.dart';

class MySvg extends StatelessWidget {
  final String assetName;

  final String semanticsLabel;
  final ColorFilter? color;

  const MySvg(
      {super.key,
      required this.assetName,
      this.semanticsLabel = '',
      this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      semanticsLabel: semanticsLabel,
      colorFilter: color,
    );
  }
}
