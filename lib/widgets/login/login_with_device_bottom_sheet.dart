import 'package:bizcotap/utils/app_exports.dart';

class LoginWithDeviceBottomSheet extends StatelessWidget {
  const LoginWithDeviceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    bool isIOSPlatform = Platform.isIOS;

    return SizedBox(
      height: getSizeByScreenHeight(context, 35),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MySvg(assetName: AppConstants.nfcDeviceSvgOutlined),
            SizedBox(
              height: getSizeByScreenHeight(
                context,
                4,
              ),
            ),
            MyText(
              text: 'Tap your Bizcotap Tag',
              fontSize: getSizeByScreenWidth(
                context,
                6,
              ),
              fontWeight: FontWeight.bold,
              color: AppColors.lightDark,
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: getSizeByScreenHeight(
                    context,
                    2,
                  ),
                  right: getSizeByScreenWidth(context, 8),
                  left: getSizeByScreenWidth(context, 8),
                ),
                child: MyText(
                  text:
                      'Please Tap your Bizcotap Tag on the back ${isIOSPlatform ? 'top' : 'center'} of your phone and we get you logged in',
                  fontSize: getSizeByScreenWidth(
                    context,
                    3.9,
                  ),
                  textAlign: TextAlign.justify,
                  color: AppColors.lighterDark,
                )),
            SizedBox(
              height: getSizeByScreenHeight(
                context,
                4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
