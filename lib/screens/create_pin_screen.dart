// ignore_for_file: avoid_print

import 'package:bizcotap/utils/app_exports.dart';

import 'package:flutter/cupertino.dart';

class CreatePIN extends StatefulWidget {
  const CreatePIN({super.key});
  @override
  State<CreatePIN> createState() => _CreatePINState();
}

class _CreatePINState extends State<CreatePIN> {
  TextEditingController pinController = TextEditingController();

  String enterPin = '';
  bool isPinvisible = false;

  void _confirmPin() {
    if (enterPin.length == 4) {
      Navigator.pop(context);
    }
  }

  Widget numButton(int number) {
    return Padding(
      padding: EdgeInsets.all(
        getSizeByScreenWidth(context, 1),
      ),
      child: Container(
        height: 60,
        width: 120,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadiusDirectional.circular(9),
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              if (enterPin.length < 4) {
                enterPin += number.toString();
                pinController.text = enterPin;
              }
            });
          },
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: getSizeByScreenHeight(context, 3),
              color: AppColors.dark,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Create PIN',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w600,
      ),
      body: Column(
        children: [
          Container(
            height: getSizeByScreenHeight(context, 20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/commons/otp 1.png',
                ),
              ),
            ),
          ),
          const MySizedBox(
            height: 6,
          ),
          const MySizedBox(
            width: 60,
            child: MyText(
              text:
                  'Finally , Enter 4 digits Number to keep your profile TAG protected ',
              textAlign: TextAlign.center,
            ),
          ),
          const MySizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                width: isPinvisible
                    ? getSizeByScreenWidth(context, 4)
                    : getSizeByScreenWidth(context, 6),
                height: isPinvisible
                    ? getSizeByScreenHeight(context, 1)
                    : getSizeByScreenHeight(context, 3),
                margin: EdgeInsets.all(
                  getSizeByScreenWidth(context, 3),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(
                    getSizeByScreenWidth(context, 9),
                  ),
                  color: index < enterPin.length
                      ? isPinvisible
                          ? AppColors.lighterDark
                          : AppColors.primary
                      : AppColors.lighterDark.withOpacity(0.4),
                ),
                child: isPinvisible && index < enterPin.length
                    ? Center(
                        child: MyText(
                          text: enterPin[index],
                          color: CupertinoColors.systemBlue,
                        ),
                      )
                    : null,
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getSizeByScreenWidth(
                context,
                10,
              ),
              vertical: getSizeByScreenHeight(context, 2),
            ),
            child: MyOutlinedButton(
              onPressed: _confirmPin,
              text: const Text(
                'Confirm',
                style: TextStyle(color: AppColors.background),
              ),
              buttonColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (enterPin.length == 4) {
                    return AppColors.primary; // Change to your desired color
                  } else {
                    return AppColors.lighterDark
                        .withOpacity(0.8); // Change to your desired color
                  }
                },
              ),
            ),
          ),
          const MySizedBox(
            height: 1,
          ),
          Expanded(
            child: Container(
              height: getSizeByScreenHeight(context, 37.3),
              color: AppColors.lighterDark.withOpacity(0.2),
              child: Column(
                children: [
                  SizedBox(
                    height: getSizeByScreenHeight(context, 0.5),
                  ),
                  for (var i = 0; i < 3; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getSizeByScreenWidth(context, 0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          3,
                          (int index) => numButton(1 + i * 3 + index),
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              right: getSizeByScreenWidth(context, 1)),
                          child: numButton(0)),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (enterPin.isNotEmpty) {
                              enterPin =
                                  enterPin.substring(0, enterPin.length - 1);
                            }
                          });
                        },
                        style: ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(
                              AppColors.lighterDark.withOpacity(0)),
                          shape: MaterialStatePropertyAll(
                            BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getSizeByScreenWidth(context, 10),
                          ),
                          child: Icon(
                            Icons.backspace,
                            color: AppColors.dark,
                            size: getSizeByScreenWidth(context, 7),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }
}
