import 'package:bizcotap/utils/app_exports.dart';

bool calculateBrightness(Color color) {
  // print(color);
  double brightness =
      color.red * 0.299 + color.green * 0.587 + color.blue * 0.114;
  return brightness < 128;
}
