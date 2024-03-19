import 'package:bizcotap/utils/app_exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _refresh() {
    return Future.delayed(
      const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: const TitleWidget(),
      actions: const [NotificationAction()],
      centerTitle: false,
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _refresh,
        child: const SingleChildScrollView(
          child: MySizedBox(
            width: double.infinity,
            height: 82,
            child: Column(
              children: [
                TagsLayout(),
                QuickActions(),
                RecentExchangedContacts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
