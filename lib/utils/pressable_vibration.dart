import 'package:bizcotap/utils/app_exports.dart';

Future<void> vibrateAndPerformAction({
  List<int> vibrationPattern = const [200, 100, 200],
  required void Function() function,
}) async {
  final hasVibrator = await Vibration.hasVibrator();

  if (hasVibrator != null && hasVibrator) {
    await Vibration.vibrate(pattern: vibrationPattern);
  }

  function();
}
