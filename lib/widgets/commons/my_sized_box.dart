import 'package:bizcotap/utils/app_exports.dart';

class MySizedBox extends StatelessWidget {
  const MySizedBox({super.key, this.width, this.height, this.child});

  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width != null ? getSizeByScreenWidth(context, width!) : null,
      height: height != null ? getSizeByScreenHeight(context, height!) : null,
      child: child,
    );
  }
}
