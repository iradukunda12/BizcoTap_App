import 'package:bizcotap/utils/app_exports.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    // Set the desired status bar style when this screen is first displayed
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  final PageController _controller = PageController();
  int currentPage = 0;

  void _onChangeCurrentPage() {
    if (currentPage < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: slideDataList.map((data) {
              return MySlide(data: data);
            }).toList(),
          ),
          MySmoothIndicator(
            controller: _controller,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  getSizeByScreenWidth(context, 8.5),
                  0,
                  getSizeByScreenWidth(context, 8.5),
                  getSizeByScreenHeight(context, 7)),
              child: MyOutlinedButton(
                onPressed: _onChangeCurrentPage,
                text: MyText(
                  text: currentPage < 2 ? 'Next' : 'Get Started',
                  color: AppColors.light,
                  fontSize: getSizeByScreenWidth(context, 4.5),
                ),
                icon: MyIcon(
                  icon: Icons.arrow_forward_ios,
                  size: getSizeByScreenWidth(context, 4.5),
                  color: AppColors.light,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
