import 'package:bizcotap/utils/app_exports.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedScreenIndex = 0;

  void _showBackDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.background,
          surfaceTintColor: Colors.transparent,
          title: const Text('Exit'),
          content: const Text(
            'Are you sure you want to exit?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Exit'),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define active screen
    Widget activeScreen = const HomeScreen();

    switch (_selectedScreenIndex) {
      case 1:
        activeScreen = const ScanScreen();
        break;
      case 2:
        activeScreen = const BDropScreen();
        break;
      case 3:
        activeScreen = const ContactsScreen();
        break;
      case 4:
        activeScreen = const SettingsScreen();
        break;
      default:
        activeScreen = const HomeScreen();
        break;
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        _showBackDialog();
      },
      child: MyBottomNavigation(
        body: activeScreen,
        bottomNavigationBar: MyBottomAppBar(
          selectScreen: _selectScreen,
          selectedScreenIndex: _selectedScreenIndex,
        ),
        floatingActionButton: MyCircularFloatingActionButton(
          onPressed: () => _selectScreen(2),
          size: 60,
          icon: Icons.emergency_share_outlined,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
