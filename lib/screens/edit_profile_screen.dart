import 'package:bizcotap/utils/app_exports.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode devicePinFocusNode = FocusNode();

  bool allFieldsFilled() {
    return nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        devicePinController.text.isNotEmpty;
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController devicePinController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void dispose() {
    nameFocusNode.dispose();
    phoneFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    devicePinFocusNode.dispose();

    nameController.removeListener(updateButtonState);
    phoneController.removeListener(updateButtonState);
    emailController.removeListener(updateButtonState);
    passwordController.removeListener(updateButtonState);
    devicePinController.removeListener(updateButtonState);

    super.dispose();
  }

  String? emailError;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPasswordPassword = false;
  bool showDevicePin = false;

  String? editedImagePath;

  String initialLetter = '';

  MyImagePicker imagePicker = MyImagePicker();

  Future<void> selectProfileImage() async {
    await imagePicker.selectProfileImage();
    setState(() {
      editedImagePath = imagePicker.editedImagePath;
    });
  }

  void _saveProfile() {
    Widget widget;
    if (Platform.isIOS) {
      widget = const CupertinoReusableAlertDialog(
        content: 'Your account has been successfully updated',
        customImage: MySvg(
          assetName: AppConstants.successSvg,
        ),
      );
    } else {
      widget = const MaterialAlertDialog(
        title: '',
        content: 'Your account has been successfully updated',
        customImage: MySvg(
          assetName: AppConstants.successSvg,
        ),
      );
    }
    if (_formKey.currentState!.validate()) {
      bool updateSuccess = true;

      if (updateSuccess) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return widget;
          },
        );
      }
    }
  }

  Color getButtonColor() {
    return allFieldsFilled() ? AppColors.primary : Colors.grey;
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(updateButtonState);
    phoneController.addListener(updateButtonState);
    emailController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
    devicePinController.addListener(updateButtonState);
    nameController.addListener(() {
      setState(() {
        initialLetter = nameController.text.isNotEmpty
            ? nameController.text[0].toUpperCase()
            : '';
      });
    });
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = allFieldsFilled();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: MyAppBar(
        title: MyText(
          text: 'Edit Profile Screen',
          fontSize: getSizeByScreenWidth(
            context,
            5,
          ),
          color: AppColors.dark,
          fontWeight: FontWeight.w600,
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.all(getSizeByScreenWidth(context, 6)),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                MySizedBox(
                  height: 15,
                  child: Stack(children: [
                    CircleAvatar(
                      radius: getSizeByScreenHeight(context, 50),
                      backgroundColor: AppColors.primary,
                      backgroundImage: editedImagePath != null
                          ? FileImage(File(editedImagePath!))
                          : null,
                      child: editedImagePath == null
                          ? (nameController.text.isNotEmpty
                              ? MyText(
                                  text: initialLetter.toUpperCase(),
                                  color: AppColors.background,
                                  fontSize: getSizeByScreenHeight(context, 5),
                                  textAlign: TextAlign.center,
                                )
                              : Container())
                          : null,
                    ),
                    Positioned(
                      right: getSizeByScreenWidth(context, 30),
                      top: getSizeByScreenHeight(context, 9),
                      child: GestureDetector(
                        onTap: selectProfileImage,
                        child: Container(
                          height: getSizeByScreenHeight(context, 7),
                          width: getSizeByScreenWidth(context, 10.5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: getSizeByScreenHeight(context, 0.5),
                                color: AppColors.background),
                            color: AppColors.primary,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                                getSizeByScreenHeight(context, 1.2)),
                            child: const MySvg(assetName: AppConstants.editSvg),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
                const MySizedBox(
                  height: 5,
                ),
                MyTextInput(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  labelStyle: TextStyle(
                    color: AppColors.lightDark.withOpacity(0.5),
                  ),
                  labelText: 'Names',
                  focusNode: nameFocusNode,
                  validator: (text) {
                    return MyValidations.validateName(text);
                  },
                ),
                const MySizedBox(
                  height: 2.5,
                ),
                MyTextInput(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  labelText: 'Phone number',
                  labelStyle:
                      TextStyle(color: AppColors.lightDark.withOpacity(0.5)),
                  focusNode: phoneFocusNode,
                  validator: (text) {
                    return MyValidations.validatePhoneNumber(text);
                  },
                ),
                const MySizedBox(
                  height: 2.5,
                ),
                MyTextInput(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Email',
                  focusNode: emailFocusNode,
                  labelStyle:
                      TextStyle(color: AppColors.lightDark.withOpacity(0.5)),
                  validator: (text) {
                    return MyValidations.validateEmail(text);
                  },
                ),
                const MySizedBox(
                  height: 2.5,
                ),
                Stack(
                  children: [
                    MyTextInput(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      labelText: 'Password',
                      focusNode: passwordFocusNode,
                      obscureText: !showPasswordPassword,
                      labelStyle: TextStyle(
                          color: AppColors.lightDark.withOpacity(0.5)),
                      validator: (text) => MyValidations.validatePassword(text),
                    ),
                    if (passwordFocusNode.hasFocus)
                      Positioned(
                        right: 10,
                        top: 18,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              showPasswordPassword = !showPasswordPassword;
                            });
                          },
                          child: Icon(
                            showPasswordPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                  ],
                ),
                const MySizedBox(
                  height: 2.5,
                ),
                Stack(children: [
                  MyTextInput(
                    controller: devicePinController,
                    keyboardType: TextInputType.number,
                    labelText: 'Device PIN',
                    focusNode: devicePinFocusNode,
                    obscureText: !showDevicePin,
                    labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 118, 123, 115)
                            .withOpacity(0.5)),
                    validator: (text) {
                      return MyValidations.validateDevicePin(text);
                    },
                  ),
                  if (devicePinFocusNode.hasFocus)
                    Positioned(
                      right: 10,
                      top: 18,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            showDevicePin = !showDevicePin;
                          });
                        },
                        child: Icon(
                          showDevicePin
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                ]),
                const MySizedBox(
                  height: 3,
                ),
                MyOutlinedButton(
                  onPressed: isButtonEnabled ? _saveProfile : null,
                  text: const MyText(
                    text: 'Save changes',
                    color: AppColors.background,
                  ),
                  buttonColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey;
                    }
                    return AppColors.primary;
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
