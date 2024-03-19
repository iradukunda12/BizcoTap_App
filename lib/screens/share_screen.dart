import 'package:bizcotap/utils/app_exports.dart';
import 'package:bizcotap/widgets/commons/my_loader.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  bool _isLoading = false;

  void _share() async {
    setState(() {
      _isLoading = true;
    });

    await Share.share(
        'https://link.bizcotap.com/profile/5689001546315d3c5869e9',
        subject: 'Share my contacts');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Share your contact',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: getSizeByScreenHeight(context, 8),
          left: getSizeByScreenWidth(context, 4),
          right: getSizeByScreenWidth(context, 4),
        ),
        child: Column(
          children: [
            const ProfileCard(),
            const MySizedBox(height: 6),
            Center(
              child: _isLoading
                  ? const MyLoader(
                      backgroundColor: Colors.transparent,
                    )
                  : MyImportButton(
                      width: getSizeByScreenWidth(context, 40),
                      onPressed: _share,
                      text: const Text(
                        'Share Contact',
                        style: TextStyle(
                          color: AppColors.lightDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      buttonColor: MaterialStatePropertyAll(
                          AppColors.lightDark.withOpacity(0.2)),
                      icon: Icon(
                        Icons.share,
                        color: AppColors.dark.withOpacity(0.7),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
