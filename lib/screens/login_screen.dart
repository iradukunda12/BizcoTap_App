// ignore_for_file: avoid_print
import 'package:bizcotap/utils/app_exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool showPassword = false;
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

  void _onLogin() {
    // Validate the individual form fields manually.
    final emailError = MyValidations.validateEmail(_emailController.text);
    final passwordError =
        MyValidations.validatePassword(_passwordController.text);

    if (emailError != '' || passwordError != '') {
      print('Validation errors exist.');
    } else {
      Navigator.of(context).pushReplacementNamed('/navigation');
    }
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      elevation: 10,
      showDragHandle: true,
      builder: (BuildContext context) {
        return const LoginWithDeviceBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        _showBackDialog();
      },
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage(AppConstants.semiCircles),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Container(
              padding: EdgeInsets.only(
                top: getSizeByScreenHeight(context, 20),
                left: getSizeByScreenWidth(context, 6),
                right: getSizeByScreenWidth(context, 6),
              ),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MyText(
                        text: 'Hello, Welcome back!',
                        fontWeight: FontWeight.bold,
                        fontSize: getSizeByScreenWidth(
                          context,
                          5.5,
                        ),
                      ),
                      const MySizedBox(
                        width: 2,
                      ),
                      const Icon(
                        Icons.waving_hand,
                        color: AppColors.accent,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getSizeByScreenHeight(context, 1.5),
                      bottom: getSizeByScreenHeight(context, 4),
                    ),
                    child: MyText(
                      text: 'Login to your bizcotap',
                      color: AppColors.lighterDark,
                      fontSize: getSizeByScreenWidth(
                        context,
                        4.5,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: getSizeByScreenHeight(
                            context,
                            2,
                          )),
                          child: MyTextInput(
                            controller: _emailController,
                            validator: (text) {
                              return MyValidations.validateEmail(text);
                            },
                            keyboardType: TextInputType.emailAddress,
                            focusNode: _emailFocusNode,
                            labelText: 'Email',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: getSizeByScreenHeight(
                              context,
                              2,
                            ),
                          ),
                          child: Stack(
                            children: [
                              MyTextInput(
                                keyboardType: TextInputType.visiblePassword,
                                focusNode: _passwordFocusNode,
                                labelText: 'Password',
                                controller: _passwordController,
                                obscureText: !showPassword,
                                validator: (text) =>
                                    MyValidations.validatePassword(text),
                              ),
                              if (_passwordFocusNode.hasFocus)
                                Positioned(
                                  right: 10,
                                  top: 18,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                    child: Icon(
                                      showPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      size: 20, // Adjust the size as needed
                                      color: Colors
                                          .black, // Adjust the color as needed
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: getSizeByScreenHeight(
                            context,
                            1,
                          )),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: getSizeByScreenHeight(
                                  context,
                                  2,
                                )),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/forgot-password');
                                  },
                                  style: const ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                  ),
                                  child: const MyText(
                                    text: 'Forgot Password',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: getSizeByScreenHeight(
                            context,
                            2,
                          )),
                          child: MyOutlinedButton(
                            onPressed: _onLogin,
                            text: MyText(
                              text: 'Login',
                              color: AppColors.background,
                              fontWeight: FontWeight.bold,
                              fontSize: getSizeByScreenWidth(
                                context,
                                4.5,
                              ),
                            ),
                            buttonColor: MaterialStateProperty.all(
                              AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: getSizeByScreenHeight(
                      context,
                      4,
                    )),
                    child: const LoginOptionDivider(),
                  ),
                  Center(
                    child: Container(
                      width: getSizeByScreenWidth(context, 72),
                      padding: EdgeInsets.only(
                        top: getSizeByScreenHeight(
                          context,
                          2,
                        ),
                      ),
                      child: TextButton(
                        onPressed: _showBottomSheet,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const MySvg(assetName: AppConstants.nfcDeviceSvg),
                              MyText(
                                text: 'Login with your Bizcotap Tag',
                                color: AppColors.dark,
                                fontSize: getSizeByScreenWidth(
                                  context,
                                  4.4,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.bottomCenter,
                          image: AssetImage(
                            AppConstants.semiCirclesFlipped,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
