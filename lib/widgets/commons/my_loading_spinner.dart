import 'package:bizcotap/utils/app_exports.dart';

class MyLoadingSpinner extends StatelessWidget {
  const MyLoadingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
