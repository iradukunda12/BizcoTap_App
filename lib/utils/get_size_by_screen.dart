import 'package:bizcotap/utils/app_exports.dart';

double getSizeByScreenHeight(BuildContext context, double percentage) {
  double screenHeight = MediaQuery.of(context).size.height;
  return screenHeight * (percentage / 100);
}

double getSizeByScreenWidth(BuildContext context, double percentage) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth * (percentage / 100);
}
