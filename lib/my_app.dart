import 'package:bizcotap/utils/app_exports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        bottomSheetTheme: BottomSheetThemeData(
          surfaceTintColor: Colors.grey.shade400,
        ),
      ),
      title: AppConstants.appTitle,
      initialRoute: '/onboarding',
      routes: appRoutes,
    );
  }
}
