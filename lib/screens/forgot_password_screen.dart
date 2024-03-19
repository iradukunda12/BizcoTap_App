import 'package:bizcotap/utils/app_exports.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  void _saveProfile() {
    Widget widget;
    if (Platform.isIOS) {
      widget = const CupertinoReusableAlertDialog(
        content: 'Reset email has been sent',
        customImage: MySvg(
          assetName: AppConstants.successSvg,
        ),
      );
    } else {
      widget = const MaterialAlertDialog(
        title: '',
        content: 'Reset email has been sent',
        customImage: MySvg(
          assetName: AppConstants.successSvg,
        ),
      );
    }

    bool resetSuccess = true;

    if (resetSuccess) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return widget;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Reset password',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getSizeByScreenWidth(context, 5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: 'Forgot your password?',
              fontSize: getSizeByScreenWidth(context, 6),
              fontWeight: FontWeight.bold,
            ),
            const MySizedBox(
              height: 2,
            ),
            MyText(
              text:
                  'Add the number or email associated with your account and we will send you instructions to reset your password ',
              fontSize: getSizeByScreenWidth(context, 4),
            ),
            const MySizedBox(
              height: 5,
            ),
            const MyText(
              text: 'Email/Phone number',
              fontWeight: FontWeight.bold,
            ),
            const MySizedBox(
              height: 2,
            ),
            MyTextInput(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'Email',
              focusNode: _emailFocusNode,
              validator: (text) {
                return MyValidations.validateEmail(text);
              },
            ),
            const MySizedBox(
              height: 3,
            ),
            MyOutlinedButton(
              onPressed: _saveProfile,
              text: const MyText(
                text: 'Continue',
                color: AppColors.background,
              ),
              buttonColor: const MaterialStatePropertyAll(AppColors.primary),
            )
          ],
        ),
      ),
    );
  }
}
