import 'package:bizcotap/utils/app_exports.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    super.key,
    required this.selectedScreenIndex,
    required this.selectScreen,
  });

  final int selectedScreenIndex;
  final void Function(int index) selectScreen;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      padding: const EdgeInsets.all(0),
      surfaceTintColor: AppColors.background,
      shadowColor: AppColors.primary,
      elevation: 13,
      shape: const MyNotchedRectangle(),
      notchMargin: 4.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyAppBarItem(
            label: 'Home',
            icon: Icons.home,
            isSelected: selectedScreenIndex == 0,
            onPressed: () => selectScreen(0),
          ),
          MyAppBarItem(
            label: 'Scan Card',
            icon: Icons.qr_code_scanner,
            isSelected: selectedScreenIndex == 1,
            onPressed: () => selectScreen(1),
          ),
          SizedBox(
            width: getSizeByScreenWidth(
              context,
              getSizeByScreenWidth(context, 5),
            ),
          ),
          MyAppBarItem(
            label: 'Contacts',
            icon: Icons.perm_contact_cal,
            isSelected: selectedScreenIndex == 3,
            onPressed: () => selectScreen(3),
          ),
          MyAppBarItem(
            label: 'Settings',
            icon: Icons.settings,
            isSelected: selectedScreenIndex == 4,
            onPressed: () => selectScreen(4),
          ),
        ],
      ),
    );
  }
}
