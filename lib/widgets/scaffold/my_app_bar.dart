import 'package:bizcotap/utils/app_exports.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    this.appBarBackgroundColor = AppColors.background,
    this.centerTitle,
    this.bodyBackgroundColor = AppColors.background,
    this.actions,
    this.title,
    this.shadowColor = Colors.red,
    this.elevation = 0,
    this.scrolledUnderElevation = 0,
    required this.body,
  });

  final Color appBarBackgroundColor;
  final Color bodyBackgroundColor;
  final Color shadowColor;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Widget? title;
  final double elevation;
  final double scrolledUnderElevation;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: scrolledUnderElevation,
        surfaceTintColor: AppColors.light,
        shadowColor: shadowColor,
        elevation: elevation,
        backgroundColor: appBarBackgroundColor,
        title: title,
        actions: actions,
        centerTitle: centerTitle,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      backgroundColor: bodyBackgroundColor,
      body: body,
      resizeToAvoidBottomInset: false,
    );
  }
}
