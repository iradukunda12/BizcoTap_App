import 'package:bizcotap/utils/app_exports.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    super.key,
    required this.selectedScreenIndex,
    required this.selectScreen,
  });

  final int selectedScreenIndex;
  final void Function(int index) selectScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBackground.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 10,
        onTap: selectScreen,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedScreenIndex,
        unselectedItemColor: AppColors.lighterDark,
        selectedItemColor: AppColors.primary,
        enableFeedback: true,
        backgroundColor: AppColors.background,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          _customBottomNavigationBarItem(),
          const BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_cal),
            label: 'Contacts',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _customBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: Container(
        width: 65.0,
        height: 65.0,
        decoration: BoxDecoration(
          color: selectedScreenIndex == 2
              ? AppColors.primary // Mark as active
              : AppColors.lightDark,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.emergency_share_outlined,
              color: AppColors.light,
            ),
            MyText(
              text: 'bDrop',
              fontSize: 12,
              color: AppColors.light,
            ),
          ],
        ),
      ),
      label: '',
    );
  }
}
