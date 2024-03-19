import 'package:bizcotap/utils/app_exports.dart';

class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({super.key});

  @override
  State<ReportProblemScreen> createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {
  TextEditingController emailSubjectController = TextEditingController();
  TextEditingController emailContentController = TextEditingController();
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();

    emailSubjectController.addListener(_updateButtonState);
    emailContentController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _isButtonDisabled = emailContentController.text.isEmpty ||
          emailSubjectController.text.isEmpty;
    });
  }

  void sendEmail(String content, String subject) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@bizcotap.com',
      query:
          'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(content)}',
    );

    if (!await launchUrlString(emailLaunchUri.toString())) {
      throw Exception('Could not launch email');
    }
  }

  @override
  void dispose() {
    emailSubjectController.dispose();
    emailContentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      title: MyText(
        text: 'Report a Problem',
        fontSize: getSizeByScreenWidth(
          context,
          5,
        ),
        color: AppColors.dark,
        fontWeight: FontWeight.w500,
      ),
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.background,
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: getSizeByScreenWidth(context, 4),
            vertical: getSizeByScreenHeight(context, 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: getSizeByScreenWidth(context, 2.5)),
                child: const MyText(
                  text: 'We will respond to you via Email',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const MySizedBox(
                height: 2,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.lighterDark.withOpacity(0.1),
                    borderRadius: BorderRadiusDirectional.circular(
                        getSizeByScreenWidth(context, 4))),
                child: CustomTextFormField(
                  label: '',
                  decoration: InputDecoration(
                      hintText: 'Type your subject here',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: getSizeByScreenWidth(context, 4),
                          vertical: getSizeByScreenHeight(context, 1))),
                  controller: emailSubjectController,
                  maxLines: 1,
                ),
              ),
              const MySizedBox(
                height: 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.lighterDark.withOpacity(0.1),
                        borderRadius: BorderRadiusDirectional.circular(20)),
                    child: CustomTextFormField(
                      label: '',
                      controller: emailContentController,
                      maxLines: 8,
                      decoration: const InputDecoration(
                          hintText: 'Type your problem here',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          )),
                    ),
                  ),
                ],
              ),
              const MySizedBox(
                height: 3,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: getSizeByScreenWidth(context, 2.5),
                        right: getSizeByScreenWidth(context, 2.5)),
                    child: const MyText(
                      text: reportProblemData,
                      textAlign: TextAlign.justify,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const MySizedBox(
                    height: 3,
                  ),
                  MyOutlinedButton(
                    onPressed: disableButtonIf(_isButtonDisabled, () {
                      sendEmail(
                        emailContentController.text,
                        emailSubjectController.text,
                      );
                    }),
                    text: const MyText(
                      text: 'Send via Email',
                      textAlign: TextAlign.left,
                      color: AppColors.background,
                    ),
                    buttonColor: MaterialStateProperty.all(
                      _isButtonDisabled
                          ? AppColors.lighterDark.withOpacity(0.5)
                          : AppColors.primary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
